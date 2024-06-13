from app import app
from model.user_model import user_model
from flask import request,send_file
from datetime import datetime
obj=user_model()


@app.route("/welcome",methods=["POST"])
def user_welcome_controller():
    return obj.user_welcome_model(request.form)
@app.route("/signup_signin",methods=["POST"])
def user_signup_signin_controller():
    return obj.user_singup_signin(request.form)