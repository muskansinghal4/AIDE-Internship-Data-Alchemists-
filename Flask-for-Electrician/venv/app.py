from flask import Flask, render_template,request, jsonify
import mysql.connector
import json
import datetime
app = Flask(__name__)

# MySQL configuration
mysql_config = {
    'host': 'localhost',
    'user': 'root',
    'password': '',
    'database': 'group-project-1',
    # 'autocommit': True  # Ensure autocommit is set to True
}
print("Am i even running")
# @app.route('/')
@app.route('/homepage')
def homepage():
    print("Well it seems i am also running")
    try:
        # Connect to MySQL database
        conn = mysql.connector.connect(**mysql_config)
        cursor = conn.cursor(dictionary=True)

        # Fetch major categories
        cursor.execute("SELECT mc_id, mc_name FROM major_category_table")
        major_categories = cursor.fetchall()

        # Iterate through major categories and fetch their subcategories
        for category in major_categories:
            cursor.execute("SELECT sc_name FROM sub_category_table WHERE mc_id = %s", (category['mc_id'],))
            subcategories = cursor.fetchall()
            category['subcategories'] = subcategories

        cursor.close()
        conn.close()

        return render_template('homepage.html', major_categories=major_categories)
    
    except Exception as e:
        print("Error fetching major categories:", e)
        return "Error fetching major categories"
if __name__ == '__main__':
    app.run(debug=True)

varforrouteauth=''

from flask import url_for, session,redirect
from authlib.integrations.flask_client import OAuth


app.secret_key = '!secret'
app.config.from_object('config')
# Google OAuth configuration
CONF_URL = 'https://accounts.google.com/.well-known/openid-configuration'
oauth = OAuth(app)
oauth.register(
    name='google',
    server_metadata_url=CONF_URL,
    client_kwargs={
        'scope': 'openid email profile'
    }
)

@app.route('/login')
def login():
    redirect_uri = url_for('auth', _external=True)
    return oauth.google.authorize_redirect(redirect_uri)

@app.route('/auth')
def auth():
    token = oauth.google.authorize_access_token()
    session['user'] = token['userinfo']
    print("user authorized")
    return redirect(varforrouteauth)

@app.route('/logout')
def logout():
    session.pop('user', None)
    return redirect('/')


@app.route('/')
@app.route('/bookings')
def booking():

    user = session.get('user')
    if not user:
        global varforrouteauth
        varforrouteauth='/bookings'
        return redirect(url_for('login'))
    print(user)
    selected_services=[1111,1138,1151,1205]
    user_email=user['email']
    user_name=user['name']
    try:
        conn = mysql.connector.connect(**mysql_config)
        cursor = conn.cursor(dictionary=True)

        # Check if the user exists
        cursor.execute("SELECT user_id FROM users_table WHERE user_email = %s", (user_email,))
        user_row = cursor.fetchone()

        if user_row:
            user_id = user_row['user_id']
        else:
            # Insert new user into the users_table
            cursor.execute(
                "INSERT INTO users_table (user_name, user_email) VALUES (%s, %s)",
                (user_name, user_email)
            )
            conn.commit()  # Commit the transaction to get the new user_id
            user_id = cursor.lastrowid

        if user_id is not None and selected_services:
            # Fetch user details
            cursor.execute("SELECT user_name, user_email FROM users_table WHERE user_id = %s", (user_id,))
            user_details = cursor.fetchone()

            if not user_details:
                return "Error: User not found"

            bill_details = {
                'name': user_details['user_name'],
                'email': user_details['user_email'],
                'services': [],
                'total_amount': 0
            }
            total_amount = 0
            total_duration = 0
            for service_id in selected_services:
                cursor.execute(
                    "SELECT service_name, price, service_duration, warranty_id, package_id FROM service_table WHERE service_id = %s",
                    (service_id,)
                )
                service_details = cursor.fetchone()
                if service_details:
                    if service_details['service_name'].lower() == 'package' and 'package_id' in service_details:
                        cursor.execute(
                            "SELECT package_name FROM package_table WHERE package_id = %s",
                            (service_details['package_id'],)
                        )
                        package_details = cursor.fetchone()
                        if package_details:
                            service_name = package_details['package_name']
                        else:
                            service_name = "Package (ID: {})".format(service_details['package_id'])
                    else:
                        service_name = service_details['service_name']

                    service_entry = {
                        'name': service_name,
                        'price': service_details['price'],
                        'duration': service_details['service_duration'],
                        'warranty_id': service_details['warranty_id']
                    }

                    bill_details['services'].append(service_entry)
                    total_duration += service_details['service_duration']
                    total_amount += service_details['price']  # Accumulate total price

            bill_details['total_amount'] = total_amount  # Assign total_amount to bill_details
            print(total_amount)
            # Generate slot options based on total duration
            slot_options = []
            for hour in range(9, 22):  # Slots from 9 AM to 9 PM (assuming 24-hour format)
                slot_options.append(f"{hour}:00 - {hour+1}:00")

            # Generate date options for the next 3 days
            date_options = []
            today = datetime.date.today()
            for i in range(3):
                date = today + datetime.timedelta(days=i+1)
                date_options.append(date.strftime("%d %B"))  # Format date as "15 June"

            # Fetch cities available for service
            cursor.execute("SELECT DISTINCT available_for_cities FROM technician_table")
            cities_list = [row['available_for_cities'] for row in cursor.fetchall()]

            cursor.close()
            conn.close()

            return render_template('booking.html', bill=bill_details, cities_list=cities_list, selected_services=json.dumps(selected_services),
                                   slot_options=slot_options, date_options=date_options)

        else:
            return """
            <h1>Welcome!</h1>
            <p>Please <a href="/signin">sign in</a> or <a href="/signup">sign up</a> to continue.</p>
            """

    except Exception as e:
        print("Error fetching details:", e)
        return "Error fetching details"


@app.route('/confirm_booking', methods=['POST'])
def confirm_booking():
    if request.method == 'POST':
        address = request.form.get('address')
        slot = request.form.get('slot')
        date = request.form.get('date')  # Add date variable to fetch selected date
        name = request.form.get('name')
        email = request.form.get('email')
        selected_services = json.loads(request.form.get('selected_services'))
        upi_ref_no = request.form.get('upi_ref_no')
        total_amount = request.form.get('total_bill')



        try:
            conn = mysql.connector.connect(**mysql_config)
            cursor = conn.cursor(dictionary=True)

            # Fetch total price of selected services
            total_price = 0
            for service_id in selected_services:
                cursor.execute("SELECT price FROM service_table WHERE service_id = %s", (service_id,))
                service_details = cursor.fetchone()
                if service_details:
                    total_price += service_details['price']

            # Check UPI reference number in the payments_table
            cursor.execute("SELECT amount, consumed FROM payments_table WHERE UPI_Ref_No = %s", (upi_ref_no,))
            payment_details = cursor.fetchone()

            if not payment_details:
                return "Error: Invalid UPI reference number."

            if payment_details['amount'] != total_price:
                return "Error: Payment amount does not match the total bill amount. If the payment was successful then contact our helpdesk to proceed with the payment correction process."

            if payment_details['consumed'] == 1:
                return "Error: UPI reference number has already been used. Please enter the UPI reference number of the current booking."

            # Update the payment record to mark it as consumed
            cursor.execute("UPDATE payments_table SET consumed = 1 WHERE UPI_Ref_No = %s", (upi_ref_no,))
            conn.commit()

            # Fetch service details and user information as before
            bill_details = {
                'name': name,
                'email': email,
                'services': [],
                'address': address,
                'slot': slot,
                'date': date,  # Add the selected date to bill details
                'total_bill':total_amount
            }

            for service_id in selected_services:
                cursor.execute("SELECT service_name, price, service_duration, warranty_id, package_id FROM service_table WHERE service_id = %s", (service_id,))
                service_details = cursor.fetchone()

                if service_details:
                    if service_details['service_name'].lower() == 'package' and 'package_id' in service_details:
                        cursor.execute("SELECT package_name FROM package_table WHERE package_id = %s", (service_details['package_id'],))
                        package_details = cursor.fetchone()
                        if package_details:
                            service_name = package_details['package_name']
                        else:
                            service_name = f"Package (ID: {service_details['package_id']})"
                    else:
                        service_name = service_details['service_name']

                    service_entry = {
                        'name': service_name,
                        'price': service_details['price'],
                        'duration': service_details['service_duration'],
                        'warranty_id': service_details['warranty_id']
                    }

                    bill_details['services'].append(service_entry)

            cursor.close()
            conn.close()

            return render_template('bill.html', bill=bill_details)

        except Exception as e:
            print("Error fetching details:", e)
            return "Error fetching details", 500

    else:
        return "Method not allowed", 405



if __name__ == '__main__':
    app.run(debug=True)