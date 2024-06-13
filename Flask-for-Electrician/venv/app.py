from flask import Flask, render_template,request, jsonify
import mysql.connector

app = Flask(__name__)

# MySQL configuration
mysql_config = {
    'host': 'localhost',
    'user': 'root',
    'password': '',
    'database': 'group-project-1',
    # 'autocommit': True  # Ensure autocommit is set to True
}

@app.route('/')
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



# @app.route('/')
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

            # Fetch user details from users_table
            cursor.execute("SELECT user_name, user_email FROM users_table WHERE user_id = %s", (user_id,))
            user_details = cursor.fetchone()

            if not user_details:
                return "Error: User not found"
            
            bill_details = {
                'name': user_details['user_name'],
                'email': user_details['user_email'],
                'services': []
            }

            for service_id in selected_services:
                print("\n\n\nSERVICE ID:",service_id)
                cursor.execute("SELECT service_name, price, service_duration, warranty_id, package_id FROM service_table WHERE service_id = %s", (service_id,))
                service_details = cursor.fetchone()
                print(service_details)
                if service_details:
                    if service_details['service_name'].lower() == 'package' and 'package_id' in service_details:
                        # Fetch package details using package_id
                        cursor.execute("SELECT package_name FROM package_table WHERE package_id = %s", (service_details['package_id'],))
                        package_details = cursor.fetchone()
                        print(package_details)
                        if package_details:
                            service_name = package_details['package_name']
                            print(service_name)
                        else:
                            service_name = "Package (ID: {})".format(service_details['package_id'])  # Default name if package not found
                    else:
                        service_name = service_details['service_name']

                    # Prepare service entry for bill
                    service_entry = {
                        'name': service_name,
                        'price': service_details['price'],
                        'duration': service_details['service_duration'],
                        'warranty_id': service_details['warranty_id']
                    }

                    bill_details['services'].append(service_entry)
                    print(bill_details)

            cursor.close()
            conn.close()

            return render_template('bill.html', bill=bill_details)

        except Exception as e:
            print("Error fetching service details:", e)
            return "Error fetching service details"
    else:
        # If user_id is None or no services selected, prompt the user to sign in or sign up
        return """
        <h1>Welcome!</h1>
        <p>Please <a href="/signin">sign in</a> or <a href="/signup">sign up</a> to continue.</p>
        """
