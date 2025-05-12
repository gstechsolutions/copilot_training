from flask import Flask

def create_app():
    app = build_routes()
    app.run(debug=True)
 

def build_routes():
    app = Flask(__name__)

    @app.route('/101')
    def hello101():
        return "Hello, course 101!"

    return app

