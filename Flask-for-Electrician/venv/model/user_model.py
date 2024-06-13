import json
import mysql.connector
from flask import make_response
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
    def user_welcome_model(self,data):
        city = data.get('city')
        query = "SELECT * FROM `technician-table` WHERE FIND_IN_SET(%s, `available_for_cities`)"
        self.cur.execute(f"")
        self.cur.execute(query, (city,))
        result = self.cur.fetchall()
        if result:#if his city exist then redirect to sign up sign in page
            return f"Technicians available in {city}."
        else:
            return f"{city} is on our Bucket List. We will come soon to your city."