from app import app
from model.user_model import user_model
from flask import Flask, request, render_template, redirect, url_for
from datetime import datetime
obj=user_model()


@app.route("/welcome", methods=["GET", "POST"])
def user_welcome_controller():
    if request.method == 'POST':
        message = obj.user_welcome_model(request.form)
        return render_template('welcome.html', message=message)
    return render_template('welcome.html')
@app.route("/signup_signin", methods=["GET", "POST"])
def user_signup_signin_controller():
    if request.method == "POST":
        message = obj.user_signup_signin_model(request.form)
        if message:
            return render_template('signup_signin.html', message=message)
    return render_template('signup_signin.html')
