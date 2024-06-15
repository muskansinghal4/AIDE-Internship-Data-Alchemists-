from flask import Flask, render_template,request, jsonify
import mysql.connector
import json

app = Flask(__name__)

# MySQL configuration
mysql_config = {
    'host': 'localhost',
    'user': 'root',
    'password': '',
    'database': 'group-project-1',
    # 'autocommit': True  # Ensure autocommit is set to True
}

# @app.route('/')
@app.route('/homepage')
def homepage():
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



@app.route('/')
@app.route('/bookings')
def booking():
    # function call to check if user has signed in or not
    #if signed in then
    #fetch user details from the users table
    user_id = request.args.get('user_id', default=None, type=int)
    print(user_id)
    user_id=111111111

    selected_services=[1111,1138,1151,1205]
    #CODE MUST BE ADDED
    # selected_services_response=requests.get('http://localhost:5000/selected_services')
    # if selected_services_response.status_code == 200:
    #     selected_service_ids=selected_services_response.json().get('service_ids', [])
    # else:
    #     selected_service_ids = []
        # return "some error occurred"


    if user_id is not None and selected_services:
        try:
            conn = mysql.connector.connect(**mysql_config)
            cursor = conn.cursor(dictionary=True)

            # Fetch user details
            cursor.execute("SELECT user_name, user_email FROM users_table WHERE user_id = %s", (user_id,))
            user_details = cursor.fetchone()

            if not user_details:
                return "Error: User not found"
            
            bill_details = {
                'name': user_details['user_name'],
                'email': user_details['user_email'],
                'services': []
            }

            # Fetch selected services details
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
            # Fetch cities available for service
            cursor.execute("SELECT DISTINCT available_for_cities FROM technician_table")
            cities_list = [row['available_for_cities'] for row in cursor.fetchall()]

            cursor.close()
            conn.close()
            print("Booking function execution end")
            return render_template('booking.html', bill=bill_details, cities_list=cities_list, selected_services=json.dumps(selected_services))

        except Exception as e:
            print("Error fetching details:", e)
            return "Error fetching details"
    else:
        return """
        <h1>Welcome!</h1>
        <p>Please <a href="/signin">sign in</a> or <a href="/signup">sign up</a> to continue.</p>
        """


@app.route('/confirm_booking', methods=['POST'])
def confirm_booking():
    if request.method == 'POST':
        address = request.form.get('address')
        slot = request.form.get('slot')
        name = request.form.get('name')
        email = request.form.get('email')
        selected_services = json.loads(request.form.get('selected_services'))

        bill_details = {
            'name': name,
            'email': email,
            'services': []
        }

        try:
            conn = mysql.connector.connect(**mysql_config)
            cursor = conn.cursor(dictionary=True)

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

            return render_template('bill.html', bill=bill_details, address=address, slot=slot)
        except Exception as e:
            print("Error fetching details:", e)
            return "Error fetching details"
    else:
        return "Method not allowed"

if __name__ == '__main__':
    app.run(debug=True)