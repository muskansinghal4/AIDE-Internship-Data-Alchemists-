from flask import Flask, render_template,request, jsonify
app = Flask(__name__)
@app.route('/')
def home():
    return "i am alive baby"
