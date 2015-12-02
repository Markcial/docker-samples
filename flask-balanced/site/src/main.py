from flask import Flask
app = Flask(__name__)
import socket

@app.route('/')
def hello_world():
    return 'Hello World from the site : %s!'%socket.gethostname()
