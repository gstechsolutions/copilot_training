from flask import Flask

def create_app():
    app = build_routes()
    app.run(debug=True)
 

def build_routes():
    app = Flask(__name__)

    @app.route('/101')
    def hello101():
        html_content = '''
        <h1>Hello, course 101!</h1>        
        <form action="/submit" method="post">
            <label for="inputText">Enter Text:</label>
            <input type="text" id="inputText" name="inputText">
            <button type="submit">Submit</button>
        </form>
        '''
        return html_content

    @app.route('/submit', methods=['POST'])
    def submit():
        
        return "Form submitted!"

    return app

