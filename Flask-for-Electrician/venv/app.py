from flask import Flask, render_template
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
