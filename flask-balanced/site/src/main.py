from flask import Flask
app = Flask(__name__)
import socket

@app.route('/')
def hello_world():
    return 'Hello World from %s!'%socket.gethostname()
