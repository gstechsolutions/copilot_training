from flask import Flask

def create_app():
    app = build_routes()
    app.run(debug=True)


def build_routes():

    app = Flask(__name__)

    @app.route('/201')
    def hello201():
        return "Hello, course 201!"

    return app
