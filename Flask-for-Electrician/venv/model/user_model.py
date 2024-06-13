import json
import mysql.connector
from flask import make_response,redirect,url_for
from datetime import datetime,timedelta
# import jwt
class user_model():
    def __init__(self):
        try:
            self.con=mysql.connector.connect(host="localhost",username="root",password="",database="group-project-1")
            self.con.autocommit=True
            self.cur=self.con.cursor(dictionary=True)
            print("Connection successfull")
        except:
            print("Some error")
    def user_welcome_model(self, data):
        city = data.get('city')
        query = "SELECT * FROM `technician-table` WHERE FIND_IN_SET(%s, `available_for_cities`)"
        self.cur.execute(query, (city,))
        result = self.cur.fetchall()
        if result:
            return f"Technicians available in {city}."
        else:
            return f"{city} is on our Bucket List. We will come soon to your city."
    def user_signup_signin_model(self, data):
        action=data.get('action')  # 'signup' or 'signin'
        email=data.get('email')
        password=data.get('password')
        if action=='signup':
            name=data.get('name')
            confirm_password=data.get('confirm_password')
            if password!=confirm_password:
                return "Passwords do not match. Please try again."
            # Check if email already exists
            query="SELECT * FROM `users-table` WHERE `user_email` = %s"
            self.cur.execute(query, (email,))
            result=self.cur.fetchone()
            if result:
                return "Email already exists. Please sign in."
            # Insert new user
            query="""
            INSERT INTO `users-table` (user_name, user_email, user_password, user_bookings_done) 
            VALUES (%s, %s, %s, 0)
            """
            self.cur.execute(query, (name, email, password))
            return "Sign-up successful! Please sign in."
        elif action=='signin':
            # Verify user email exists
            query = "SELECT * FROM `users-table` WHERE `user_email` = %s"
            self.cur.execute(query, (email,))
            result=self.cur.fetchone()
            if not result:
                return "You have not joined us yet. Redirecting to signup page."
            # Verify user credentials
            query="SELECT * FROM `users-table` WHERE `user_email` = %s AND `user_password` = %s"
            self.cur.execute(query, (email, password))
            result=self.cur.fetchone()
            if result:
                return "sign in again"
                # return redirect(url_for('homepage'))  # Adjust the homepage route accordingly
            else:
                return "Invalid password. Please try again."
        return "Invalid action. Please try again."