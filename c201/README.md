# 201: GitHub Copilot Developer Training

_Pre-requisite: Before starting the training, please make sure you have the necessary environment setup as mentioned in [SETUP.md](../setup/SETUP.md)._

## Introduction

The following training is delivered live alongside a set of accompanying slides. However, this training can also be performed in a non-live setting, by following the instructions in this file, or by watching a recording of the live training session.

The Copilot 201 training touches on some basic topics

1. [Copilot 101 Recap](#module-1---copilot-101-recap)
2. [Repo Setup](#module-2---repo-setup)
3. [Copilot Commands](#module-3---copilot-commands)
4. [Coding with Copilot](#module-4---coding-with-copilot)
5. [Advanced Prompt Engineering](#module-5---advanced-prompt-engineering)
6. [Secure Coding](#module-6---secure-coding)
7. [Autofix](#module-7---autofix-optional)
8. [ Utilizing Copilot for QA](#module-8---utilizing-copilot-for-qa-optional)

We recommend you read the SETUP.md file prior to starting the course to familiarize yourself with the packages and tools used in these workshops.

Let's get started with a recap of the Copilot 101 training. Feel free to skip this if you wish and move into the `Coding with Copilot` section.

## Module 1 - Copilot 101 Recap

### Objective

This module provides a quick overview of the key topics covered in the 101 course to ensure participants are aligned. By the end of this module, participants will be able to:

1. Recall the fundamentals of Copilot, including its capabilities and limitations.
2. Understand how the 201 course builds upon the foundation laid in the 101 training.

### Recap

Some of you taking this course may have completed the 101 material, for others you will be jumping straight in at 201.

We've provided a quick recap of 101 below, with some explanations on how it differs to 201.

In the 101 course we covered basic material around:

1. What Copilot is, what it is good for and what you should avoid using it for.

2. Setting up and getting started using the VS Code IDE and Copilot plugin. This helped us set up an environment that can be used for testing Copilot in, and running the example code.

3. Starting out with basic Prompt Engineering, including Zero-shot, One-shot and Multi-shot concepts

4. We also looked at Copilot best practices and incrementally building on our program

5. Following this some basic tips and tricks were introduced.

6. Finally we discussed governance and control and some future roadmap items.

In this 201 workshop we have made a few assumption about the students.

1. You have completed the Copilot 101 training, or are already familiar with and have been using Copilot in a basic capacity

2. You have Python, NodeJS and VS Code installed on your machine. For more information on this, you can refer to the [SETUP.md](../SETUP.md) file which provides an overview of the tooling needed.

3. You have an active Copilot license and GitHub user

OK, now that the recap is out of the way, let's get started.

## Module 2 - Repo Setup

### Objective

This module ensures the environment is set up correctly for the training exercises. By the end of this module, participants will be able to:

1. Confirm that all prerequisites and tooling are correctly configured for smooth operation.

Covered as a prerequite prior to the class. See SETUP.md for details.

## Module 3 - Copilot Commands

### Objective

This module explores Copilot's commands and chat participants. By the end of this module, participants will be able to:

1. Leverage slash commands to generate, debug, and refine code.
2. Utilize chat participants to interact with specific features like the terminal, workspace, and editor configurations.

### Copilot Commands

Copilot provides a lot of tools to aid developers while working on their code. These include:

1. Copilot Chat and Copilot's inline features

2. Data generation and testing

3. Code refining and refactoring

4. Block Fils and Debugging

5. REST API usage

## Testing Slash Commands and Chat Participants

Before we write any code, let's run through each of the Slash commands from the slides.

Create a new dummy Python file called `slash_examples.py` in the `src` directory of the cloned repository.

We can now test some Slash commands and Chat Participants:

```
@workspace - Ask about your workspace
/explain - Explain how the code in your active editor works
/tests - Generate unit tests for the selected code
/fix - Propose a fix for the problems in the selected code
/new - Scaffold code for a new file or project in a workspace
/newNotebook - Create a new Jupyter Notebook
/fixTestFailure - Propose a fix for the failing test
/setupTests - Set up tests in your project (Experimental)
@vscode - Ask questions about VS Code
/search - Generate query parameters for workspace search
/startDebugging - Generate launch config and start debugging in VS Code (Experimental)
@terminal - Ask how to do something in the terminal
/explain - Explain something in the terminal
```

### Chat Participants

In addition to slash commands, there are specific Chat Participants that provide additional context or actions:

@workspace - Refers to your current project or workspace. It can be used to access files, directories, and other project-specific elements.
@VScode - Interacts with Visual Studio Code settings and configurations. This Chat Participant allows you to modify editor settings, themes, and extensions.
@Terminal - Provides access to the terminal within your editor. You can use this Chat Participant to run commands, scripts, and manage your development environment directly from the terminal.

## Module 4 - Coding with Copilot

### Objective

This module demonstrates Copilot's capabilities for generating and refining code. By the end of this module, participants will be able to:

1. Create and update routes, functions, and application logic using Copilot.
2. Utilize Copilot Chat to enhance and debug code interactively.
3. Incorporate direct code writing features for efficient coding.

### Coding with Copilot

We're going to start with comparing Copilot chat and Copilots code writing features.

### Generate Functions

1. Open up the `app201.py` file.

We will start with using the Copilot chat window. Open this up and let's type the following questions into it:

```console
How can I create a route using jsonify that returns a random boolean value (either true or false)?
```

Copilot chat will now give us a walk through how we can modify the code to include a new route. Let's give the example a try.

You should see a recommendation to edit the `flask` import statement to also include `jsonify`.

Update your code so it reflect Copilot chat's recommendation e.g.

```python
from flask import Flask, jsonify
```

Copilot also would like us to include the `random` library, so let's add this below the flask import statement

```python
import random
```

2. Now you should notice that since we asked the question without providing additional context (such as referencing the existing open file) that it has created a little Flask application for us. In fact we only need a portion of the code, namely the new route. For now, copy over the code for just the route, you can ignore anything else that is already duplicated in the `app201.py` file.

Your file should now look similar to the below:

```python
from flask import Flask, jsonify
import random

def create_app():
    app = build_routes()
    app.run(debug=True)


def build_routes():

    app = Flask(__name__)

    @app.route('/201')
    def hello201():
        return "Hello, course 201!"

    @app.route('/random_bool')
    def random_bool():
        return jsonify(result=random.choice([True, False]))

    return app
```

3. Save the file. Let's see if we can access the new route from the browser at http://127.0.0.1:5000/random_bool

You should see a JSON object returned:

```javascript
{
  "result": false
}
```

This approach demonstrates how we can generate functions, but as we saw without additional context we get a lot of duplicate code. We'll revisit the chat window shortly and see how we can refine our prompts to get a more targeted output.

### Direct Code Writing

Next, let's try out some techniques for direct code writing. GitHub Copilot offers code suggestions as you type, acting as an AI-powered pair programmer. It analyzes your current file and related files to offer completions for code snippets, variable names, functions, repetitive code, and even code from natural language comments. Let's try this out.

1. Add the following comment above the `return app` statement:

```python
#Default route (/)
```

2. Hit Enter to move to a new line. Copilot should suggest greyed-out code, which you can accept by hitting TAB on your keyboard.
   For example:

```python
        @app.route('/')
        def hello():
            return "Hello, World!"
```

Accept the suggestion. This route is currently at the root, but we want to move it under 201. Now let's incorporate Inline Chat to help us.

2. Select the entire `@app.route('/')` route and function code, then right-click to open the Inline Copilot Chat.

Into the text field we are going to enter the following prompt:

```console
Change this route to be under the 201 path and call it hello
```

Copilot will now generate a refactored code example, similar to the following:

```python
    @app.route('/201/hello')
    def hello():
        return "Hello, World!"
```

Now we have seen how we can use Copilot to help us create and update code, let's go back to our `@app.route('/random_bool')` route. Use the technique we just demonstrated to update the path so it is also under the `201` route.

Wouldn't it be great if we could have the `hello` route return some dummy data? Let's ask Copilot chat how we can do this.

3. Select the whole of the `hello()` function, and into the Copilot chat window on the left enter the following prompt:

```console
How can I modify this function to return `dummy_data` as a JSON object?
```

Copilot should provide a helpful suggestion here on how to refactor the code. You should see something similar to the following:

```python
@app.route('/201/hello')
def hello():
    dummy_data = {
        "name": "John Doe",
        "email": "john.doe@example.com",
        "age": 30
    }
    return jsonify(dummy_data)
```

Note: Copilot may not generate exactly this example, if you get a different suggestion, use this as an opportunity to think what a one-shot prompt or a few-shot prompt may look like. If you need some examples, look below.

<details>
<summary>Examples</summary>
One-shot: How would I update this function to return dummy data representing a user?
Few-shot: How would I update this function to return dummy data representing a user with the following keys: name, email, age
</details>

4. Copy and paste this code to replace your existing function.

You may have noticed that Copilot chat has provided an additional suggested prompt? For example:

```console
How can I access the JSON response returned by the '/201/hello' endpoint in my client-side code?
```

Select the prompt and see what it outputs! Copilot chat should now provide you some tips, tricks and code snippets on how you can access this endpoint from other applications. This is a pretty neat feature!

5. Let's select the object that the hello endpoint returns. Highlight the `dummy_data = {` down to the final `}`

Now in the Copilot chat window, ask the following prompt:

```console
Change the highlighted object to use properties for a pet cat
```

Copilot chat should generate a small recommendation such as the following:

```python
dummy_data = {
    "name": "Whiskers",
    "breed": "Maine Coon",
    "age": 5
}
```

If you don't get the result you expected, try adding more context, for example:

```console
Change the highlighted object to use key-values for a pet cat
```

Notice how this time we didn't end up with a lot of extra duplicate code? This is because we targeted our request to a small snippet of Python that was provided for context.

6. Let's try asking Copilot chat to now include `color` as a property.

```console
Please include a property for the cat's fur color, for example "color":
```

Copilot now provides a suggestion for updating our dummy data with a new property, and has provided an example color e.g.

```python
dummy_data = {
    "name": "Whiskers",
    "breed": "Maine Coon",
    "age": 5,
    "color": "Brown"
}
```

7. Our route is still called `hello` which isn't particularly relevant now. Go ahead and select the whole of the route and function code. Right click and open up the inline Copilot editor.

Enter the following prompt:

```console
Rename this route and function to cat
```

Copilot will now rename the function and route to `cat`.

Accept the change and save the file. You can now test the new `201/cat` route in your browser.

8. Let's try a little experiment out and break our new code.

We are now going to add a Python print statement to the function. However, we are going to introduce a bug. Instead of a Python 3.x print statement, we will accidentally add a Python 2.x one. These statements are differently formatted between versions of the language.

In 3.x it is `print("hello")` and in 2.x `print hello`.

Add a line below the object with `print dummy_data`.

You should see in VS Code a small yellow wiggly line below the print statement. Now click the little yellow stars icon. You should see a menu appear and the option `Explain using Copilot`.

In the Copilot chat window, Copilot will explain what the issue is with this code. For example:

> In Python 3, print is a function, so you need to use parentheses. Here's how you can update your code:
>
> `print(dummy_data)`
>
> This code will print the dummy_data dictionary to the console.

Now, click the little yellow stars again to re-open the menu.

Select `Fix using Copilot`. The pop-up will now make the recommendation to fix the code. Accept the change, and the code will be updated to use a Python 3.x print statement.

Save the file. Here we saw a very simple approach to fixing bugs in code.

### Using GitHub Copilot for Code Review

To use Copilot for code review, follow these steps:

1. **Select the Code for Review:**  
   Choose the block of code or the entire `app201.py` file that you want Copilot to review.

2. **Initiate the Review:**  
   Right-click on the selected code.

3. **Access Copilot Review Options:**  
   In the context menu, navigate to "Copilot" and select "Review and Comment." Alternatively, you can access this feature by using the "GitHub Copilot: Review and Comment" command in the Command Palette.

4. **Receive Feedback:**  
   Once initiated, Copilot will analyze the selected code and provide feedback in the form of comments attached to specific lines. You can then apply the suggestions directly.

### Using GitHub Copilot for Generate Unit Test

1.  Let's now add a Unit test using the slash command called `/tests`. Select the `@app.route('/201')` route decorator and function.

Next right click, select Copilot from the menu, and then from the submenu select `Generate Tests`. The inline Copilot window will pop up with the `/tests` slash command present.

In the refactor window at the bottom of the IDE, you will see that Copilot wants to update `test_app201.py`.

Click the refactoring example. The changes you now appear in the code window. You may see however it's duplicating some code such as the import statements. The following code snippet demonstrates this:

```python
        response = self.client.get('/201')
        self.assertEqual(response.data, b"Hello, course 201!")

if __name__ == '__main__':
    unittest.main()import unittest
from flask import Flask
from c201.src.app201 import create_app, build_routes

class TestApp201(unittest.TestCase):

    def setUp(self):
        self.app = build_routes()
        self.client = self.app.test_client()

    def test_hello101_route(self):
        response = self.client.get('/201')
        self.assertEqual(response.data, b"Hello, course 201!")

    def test_hello201_route(self):
        response = self.client.get('/201')
        self.assertEqual(response.data, b"Hello, course 201!")

if __name__ == '__main__':
    unittest.main()
```

Click the discard button. It looks like because we already have some unit tests in place Copilot is appending to the file rather than updating it.

2. Let's open the Unit Test file in a neighboring tab.

Select all of the code in the Unit Test, right click and in the inline Copilot prompt type:

```console
Include tests for the cat function in test_app201.py
```

You should now see that a new function is added for our `cat` route:

```python
    def test_cat_route(self):
        response = self.client.get('/201/cat')
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.json, {
            "name": "Whiskers",
            "breed": "Maine Coon",
            "age": 5,
            "color": "Brown"
        })
```

If you are satisfied with the result, click the `Accept` button.

However, you may get something totally unexpected. Try refining your prompt. If that does not work for you, give the chat window a try and note the differences.

3. In addition to using the `Generate Tests` option, we can also ask Copilot chat for advice on how to test our application. There are two ways to do this:

First, just enter `/tests` into Copilot chat.

As a response Copilot will regenerate the contents of what should be in our `test_app201.py` file. You can then copy and paste this directly into the file.

Second, we can ask it a more general question. In the chat window add the following prompt:

```console
I need to QA my source code. I'd like to use the unitest module. The test should be wrapped in a class.
It should test the 201 route. How should I test app201.py?
```

Copilot chat returns a fairly lengthy response here. For example:

> You can test your Flask application using a tool like pytest along with Flask-Testing extension. Here's a basic example of how you might write tests for your routes:

```python
import pytest
from flask import Flask
from flask_testing import TestCase
from app201 import create_app

class MyTest(TestCase):

    def create_app(self):
        app = create_app()
        app.config['TESTING'] = True
        return app

    def test_hello201(self):
        response = self.client.get('/201')
        self.assert200(response)
        self.assertEqual(response.data, b"Hello, course 201!")

    def test_cat(self):
        response = self.client.get('/201/cat')
        self.assert200(response)
        json_response = response.json
        self.assertEqual(json_response["name"], "Whiskers")
        self.assertEqual(json_response["breed"], "Maine Coon")
        self.assertEqual(json_response["age"], 5)
        self.assertEqual(json_response["color"], "Brown")

    def test_random_bool(self):
        response = self.client.get('/random_bool')
        self.assert200(response)
        self.assertIn('result', response.json)
        self.assertIsInstance(response.json['result'], bool)
```

> This code creates a test case for each route in your application. It sends a GET request to each route and then asserts that the response is as expected. You can run these tests using the pytest command in your terminal.

If you'd like to try this code out later, save it to a file in the tests folder!

4. Let's run the tests we created. To do this execute the following command from the terminal in the root of the cloned repository:

```console
python -m unittest discover tests
```

The test should run and output something similar to:

```python
..
----------------------------------------------------------------------
Ran 2 tests in 0.009s

OK
```

Congratulations. You've seen how we can save time generating Unit Tests. That wraps up the demonstrations in this part of the workshop.

## Module 5 - Advanced Prompt Engineering

### Objective

This module delves deeper into prompt engineering techniques. By the end of this module, participants will be able to:

1. Use zero-shot, one-shot, and few-shot prompting to generate and refine complex code.
2. Build and interact with a React frontend application connected to a Python backend.
3. Apply prompts to iteratively improve application functionality.

### Advanced Prompt Engineering

If you took the 101 course or have experience with Copilot already you'll be familiar with the basics of Prompt Engineering. In this section of the 201 course we are going to build a small React app to return some JavaScript from our Flask API.

For those of you who completed the 101 course, we will be taking a similar approach, but building upon the concepts.

As we discussed in the slides there are three approaches we can use to engineer prompts which generate code in Copilot. These are:

1. Zero-Shot prompting. Asking Copilot to generate a set of unit tests for all the code in a target Python file

2. One-Shot prompting. Asking Copilot to generate unit tests for all the code in a single Python file, and providing it with a single example.

3. Few-Shot prompting. Providing multiple examples to the prompt.

### Application Building

Let's explore these approaches by building a JavaScript application using React that can be used as a frontend for our 201 course.

1. In the `c201 > src` let's create a new folder called `static` and inside this a file called `App.jsx`

The new file will have a prompt at the top which says something similar to:

> "Press [Command][i] to ask GitHub Copilot Chat to do something".

Let's follow this command and the inline popup should appear. In this type:

```console
Write me a simple set of React components in a single file to display "Here is a cat".
Use the following example: `return <h1>{cat}</h1>`
```

Copilot will generate some code similar to the following example:

```javascript
import React from 'react';

const Cat = () => {
  const cat = 'Here is a cat';
  return <h1>{cat}</h1>;
};

const App = () => {
  return (
    <div>
      <Cat />
    </div>
  );
};

export default App;
```

Save the `App.jsx` file.

2. We may want to run our React app from a different server and call the API, so run the commands to build and serve our application.

Navigate into the static folder if you haven't already and run the following command from the terminal:

```console
npm create vite@latest c201 -- --template react
```

> [!TIP]
> Note that in npm 7+, the double-dash is required.

Once this has finished running, you should now have a new folder at `c201 > src > static > c201`.

3. When we create a new React app it generates some boilerplate code for us. We want to override this with our custom `App.jsx` file. If you completed the 101 course you will be familiar with this process.

Move your `App.jsx` file to the following location:

```console
mv App.jsx c201/src
```

4. Let's now build the app with first installing dependencies and then using vite to build the React app:

```console
cd c201
npm install
npm run build
```

You should now see the message saying the app was built.

5. Let's now serve up out application. Run the following commands:

```javascript
  npm install -D serve
  npx serve -s dist
```

Your React app should now be running:

```console
   │   Serving!                                │
   │                                           │
   │   - Local:    http://localhost:3000       │
   │   - Network:  http://192.168.1.177:3000   │
   │                                           │
   │   Copied local address to clipboard!
```

Let's test the app by navigating to:

http://localhost:3000

You should see the output:

```console
Here is a cat
```

6. Let's now try out some Zero-shot, One-shot and Multi-shot prompts to extend the functionality of this JavaScript application. The end goal is going to be calling the Python API to grab our cat dummy data.

Stop the React app in the console and then open up `App.jsx` again.

Select the lines of code which contain:

```javascript
const Cat = () => {
  const cat = 'Here is a cat';
  return <h1>{cat}</h1>;
};
```

Right click and open up the inline Copilot chat window.

Let's give it a zero-shot prompt:

```console
Update this function to call API endpoints
```

You should now see Copilot recommends some code similar to the following:

```javascript
const Cat = () => {
  const [cat, setCat] = useState('Loading...');

  useEffect(() => {
    fetch('https://api.example.com/cat')
      .then((response) => response.json())
      .then((data) => setCat(data.cat))
      .catch((error) => {
        console.error('Error fetching cat data:', error);
        setCat('Error loading cat data');
      });
  }, []);

  return <h1>{cat}</h1>;
};
```

You may see that Copilot recommended update the import statement as well, for example:

```javascript
import React, { useEffect, useState } from 'react';
```

Update your code accordingly.

7. At the moment our code is calling a non-existent API. So we can refactor this using a One-shot prompt. Select the fetch statement.

```javascript
fetch('https://api.example.com/cat')
```

Load the inline Copilot chat window and enter the following prompt:

```console
Update this fetch statement to call the Flask API. Use the http://localhost:5000/201/cat route
```

Accept this change, and the fetch statement should now read:

```javascript
fetch('http://localhost:5000/201/cat')
```

Save the changes. Let's re-build the application:

```console
npm run build
```

Now we can serve it again:

```console
npx serve -s dist
```

If you access the JavaScript application in your browser, you may see CORS error. We can have Copilot help us fix this.

8. In `app201.py` select the whole of the `/201/cat` code. Open up the inline editor and enter the One-shot prompt it with the following:

```console
Change this function to return a response object. This should include the Access-Control-Allow-Origin which should be set to *
```

The code should now be updated to:

```python
   @app.route('/201/cat')
    def cat():
        dummy_data = {
            "name": "Whiskers",
             "breed": "Maine Coon",
             "age": 5,
             "color": "Brown"
        }
        response = jsonify(dummy_data)
        response.headers.add('Access-Control-Allow-Origin', '*')
        return response
```

We'll be revising this change to the headers later in the workshop, but for now save the file. Next try refreshing your browser tab with the JavaScript (localhost:3000).

The screen is now blank! So this means we need to style the response and render it in a format that is useful.

9. In App.jsx select all of the code. Open the inline editor and enter the Multi-shot prompt:

```console
Update this to render the JSON as a table. The JSON object is defined by app201.py. Include name, age, breed and color
```

The code should be updated to something similar as follows:

```javascript
import React, { useEffect, useState } from 'react';

const Cat = () => {
  const [catData, setCatData] = useState({
    name: 'Loading...',
    age: '',
    breed: '',
    color: ''
  });

  useEffect(() => {
    fetch('http://localhost:5000/201/cat')
      .then((response) => response.json())
      .then((data) => setCatData(data))
      .catch((error) => {
        console.error('Error fetching cat data:', error);
        setCatData({
          name: 'Error loading cat data',
          age: '',
          breed: '',
          color: ''
        });
      });
  }, []);

  return (
    <table>
      <thead>
        <tr>
          <th>Name</th>
          <th>Age</th>
          <th>Breed</th>
          <th>Color</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>{catData.name}</td>
          <td>{catData.age}</td>
          <td>{catData.breed}</td>
          <td>{catData.color}</td>
        </tr>
      </tbody>
    </table>
  );
};

const App = () => {
  return (
    <div>
      <Cat />
    </div>
  );
};

export default App;
```

Save this file. Re-build and serve the application.

When you visit the URL you should now see:

```
Name	    Age	  Breed	        Color
Whiskers	5	  Maine Coon	Brown
```

Congratulations! You've used multiple prompts to build a small React application that calls a Python backend.

10. Let's quickly add some documentation to this file. Use [Control][i] to open the inline chat. Enter the slash command `/doc`. Copilot will now annotate the file with documentation. For example:

```javascript
/**
 * Represents a Cat component that displays cat information in a table.
 * @component
 */
```

This wraps up the section on Prompt Engineering. Let's now look at some best practices that build upon the above.

### Example Problems

The accompanying slides provide some extra context to the approaches we have taken in this demo. Refer to these to learn more!

## Module 6 - Secure Coding

### Objective

This module emphasizes secure coding practices with Copilot's assistance. By the end of this module, participants will be able to:

1. Identify and fix vulnerabilities such as SQL injection and improper CORS configurations.
2. Utilize Copilot to generate secure code and recommendations for improvement.

### Secure Coding

We are now going to wrap up with some examples of how Copilot can assist you in securing your code.

1. Copilot has to ability to detect vulnerable code. Copy and paste the following function into your `app201.py` file:

```python
def get_db_connection():
    conn = sqlite3.connect('example.db')
    conn.row_factory = sqlite3.Row
    return conn

@app.route('/201/search')
def search():
    query = request.args.get('query')
    conn = get_db_connection()
    cursor = conn.cursor()

    sql_query = f"SELECT * FROM users WHERE name LIKE '%{query}%'"
    cursor.execute(sql_query)

    results = cursor.fetchall()
    conn.close()

    users = [dict(row) for row in results]

    return jsonify(users)
```

The search route contain a SQL injection vulnerability, let's see if Copilot detects this.

2. In the Copilot chat window, ask the following question:

```console
What vulnerabilities exist in `app201.py`
```

Copilot will respond with a list of issues it has detected, for example:

> The app201.py file has a couple of potential vulnerabilities:
>
> SQL Injection: In the search function, the query parameter is directly used in the SQL query without any sanitization or parameterization. This opens up the possibility for SQL injection attacks.
>
> Cross-Origin Resource Sharing (CORS): The Access-Control-Allow-Origin header is set to \* in the dummy_data function. This means that any website can make a request to this endpoint, which could potentially lead to security issues.
>
> Database Connection Handling: The get_db_connection function opens a connection to the database but there's no explicit handling of connection closure in case of errors. This could potentially lead to resource leaks.
>
> Hardcoded Database Name: The database name 'example.db' is hardcoded in the get_db_connection function. This could be a problem if you want to change the database or use different databases for different environments.
>
> No Input Validation: There's no validation of the input query in the search function. This could lead to unexpected behavior or errors.
>
> No Error Handling: There's no explicit error handling in the code. If any error occurs (like database connection failure, SQL execution failure, etc.), the application might crash or behave unexpectedly.

Notice how Copilot detected that we had set the `Access-Control-Allow-Origin` to `*` earlier! Copilot has also found the issue we added with the SQL injection vulnerability.

So how can we fix this? Let's ask Copilot chat. Add in the next prompt:

```console
How do I fix the SQL injection vulnerability?
```

Copilot will respond now with a recommendation to refactor the code:

> To fix the SQL injection vulnerability, you should use parameterized queries instead of string formatting. Here's how you can do it:

```python
sql_query = "SELECT * FROM users WHERE name LIKE ?"
params = ('%' + query + '%',)
```

> In this way, the query variable is not directly included in the SQL query string. Instead, it's passed as a parameter to the SQL execution function, which properly escapes it and prevents SQL injection attacks.

3. Select the lines with the SQL injection issue:

```python
sql_query = f"SELECT * FROM users WHERE name LIKE '%{query}%'"
cursor.execute(sql_query)
```

Right click and open the Copilot inline chat window. Next enter the following prompt:

```console
Fix this SQL injection vulnerability
```

Copilot will now apply a fix similar to what was described in the Copilot chat window. For example:

```python
sql_query = "SELECT * FROM users WHERE name LIKE ?"
cursor.execute(sql_query, ('%' + query + '%',))
```

As you can see Copilot is a powerful tool to detect security issues directly during development. When combined with the other security tools provided by GitHub such as GHAS you can help to reduce the overall attack surface of your application.

## Module 7 - Autofix (Optional)

### Objective

This module introduces GitHub's Autofix feature for resolving code vulnerabilities. By the end of this module, participants will be able to:

1. Understand how CodeQL detects vulnerabilities.
2. Use Autofix to apply AI-generated fixes to security issues in the codebase.

### Autofix

Before we wrap up, let's take a look at one of GitHub's newest features - Autofix.
Autofix combines the power of GHAS and OpenAI to detect security issues and recommend fixes, which are turned into pull requests.

### CodeQL and Autofix

This module demonstrates how GitHub Advanced Security (GHAS) helps identify and fix security vulnerabilities in your code. We'll focus on exploring existing security findings and Autofix suggestions.

#### Prerequisites

- In order to complete this part of the workshop your company must have GHAS licenses and you should have the ability to switch on CodeQL and Autofix on your repository.
- Access to the copilot-training repository

#### Exploring Security Features

1. Open the copilot-training repository in your browser
2. Click the "Security" tab in the top navigation
3. Observe two key security features:
   - Code scanning alerts (powered by CodeQL)
   - Dependabot alerts (for dependency vulnerabilities)

#### Exploring CodeQL Findings

1. In the Security tab, click "Code scanning alerts"
2. You should see two alerts about Flask running in debug mode:
   - One in `app101.py`
   - One in `app201.py`
     These alerts were generated because both files contain:
   ```python
   app.run(debug=True)
   ```

#### Exploring Autofix Suggestions

1. Click the alert for app101.py
2. Notice the "Generate fix" button but DO NOT click it yet
   - This represents the "before" state of an Autofix suggestion
3. Return to Code scanning alerts and click the alert for app201.py
4. Here you'll see a complete Autofix suggestion containing:
   - A detailed explanation of the security risk
   - The proposed solution using environment variables
   - Specific code changes:
   ```python
   # Before
    app.run(debug=True)
    # After
    app.run(debug=os.getenv('FLASK_DEBUG') == '1')
   ```

#### Understanding the Fix

- The Autofix suggestion makes the debug mode configurable through an environment variable
- This prevents accidental deployment with debug mode enabled
- The fix includes proper imports and clear implementation steps
- You can choose to accept the suggestion provided by Autofix, edit in Codespaces, fix locally and push the change, or dismiss the finding.

#### Key Takeaways

1. CodeQL automatically identifies security vulnerabilities
2. Autofix provides AI-generated fix suggestions
3. Each suggestion includes:

- Problem description
- Security impact
- Ready-to-implement solution

---

## 💡 _The following section contains optional self-paced exercises you can try independently_

#### Try It Yourself (Self-Paced Exercise)

Want to see CodeQL and Autofix in action with your own code? Follow these steps:

1. **Create a Security Vulnerability**
   - Create a new branch from main
   - Add this simple Flask route with a SQL injection vulnerability:
   ```python
   @app.route('/user/<username>')
   def get_user(username):
       # DO NOT USE IN PRODUCTION - SQL Injection vulnerability!
       query = f"SELECT * FROM users WHERE username = '{username}'"
       cursor.execute(query)
       return cursor.fetchone()
   ```
2. **Create Pull Request**
   - Commit your changes and push to your branch
   - Create a pull request to main
   - Title it "feat: add user lookup route"
3. **Watch CodeQL Work**

   - Wait 1-2 minutes for CodeQL scan to complete
   - Check the "Security" tab in your PR
   - You should see a new security alert for SQL injection
   - Observe Autofix's suggested solution

4. **Review the Fix**
   - Autofix will suggest using parameterized queries
   - The suggestion will look similar to:
   ```python
   @app.route('/user/<username>')
    def get_user(username):
        query = "SELECT * FROM users WHERE username = ?"
        cursor.execute(query, (username,))
        return cursor.fetchone()
   ```
5. **Apply the Fix**
   - You can either: - Accept Autofix's suggestion directly - Create a new commit with the fixed code -
     Note: Remember to remove this test code after completing the exercise! Never deploy vulnerable code to production.

That completes our Autofix example.

## Module 8 - Utilizing Copilot for QA (Optional)

### Objective

This module demonstrates how Copilot can support QA processes. By the end of this module, participants will be able to:

1. Generate manual and automated test cases for applications using Copilot.
2. Develop a Cypress automation framework to validate application functionality.
3. Debug test runtime errors efficiently with Copilot's assistance.

### Creating manual test cases using Copilot

1. Navigate to the `qa` folder under `c201` (`copilot_training/c201/qa`). Open the `specs.md` file in the editor.
   This file contains typical specifications that a QA engineer would receive from the product manager. Let's first create manual test cases using Copilot.
2. Enter the following prompt in the Copilot chat window and use the paperclip icon in the chat to attach the `specs.md` file as context:

```console
Act as a Senior QA Engineer to create manual test cases for the application described in `specs.md`, covering positive, negative, and boundary scenarios in CSV format. The Flask application will be running on `http://127.0.0.1:5000`. Each test case should include the following components:
Test ID
Test Type
Test Environment
Prerequisites
Test Steps
Expected Results
```

Copilot should produce something similar to the following:

```csv
Test ID,Test Type,Test Environment,Prerequisites,Test Steps,Expected Results
TC001,Positive,Local - http://127.0.0.1:5000,Flask application running,1. Send GET request to /201/cat,Response status code is 200 and JSON response contains {"name": "Whiskers", "breed": "Maine Coon", "age": 5, "color": "Brown"}
TC002,Positive,Local - http://127.0.0.1:5000,Flask application running,1. Send GET request to /201/dog,Response status code is 200 and JSON response contains {"name": "Buddy", "breed": "Golden Retriever", "age": 5, "color": "Golden"}
TC003,Positive,Local - http://127.0.0.1:5000,Flask application running,1. Send GET request to /201/rabbit,Response status code is 200 and JSON response contains {"name": "Thumper", "breed": "Holland Lop", "age": 2, "color": "Brown"}
TC004,Negative,Local - http://127.0.0.1:5000,Flask application running,1. Send GET request to /201/unknown,Response status code is 404
TC005,Boundary,Local - http://127.0.0.1:5000,Flask application running,1. Send GET request to /201/cat with a very long URL,Response status code is 414 (URI Too Long)
TC006,Boundary,Local - http://127.0.0.1:5000,Flask application running,1. Send GET request to /201/cat with special characters in URL,Response status code is 400 (Bad Request)
```

3. Insert the test cases into the new CSV file `manual_test_cases.csv` by clicking "Insert into new file" in the chat window.

That was a demonstration of how to create manual test cases using Copilot Chat.

### Create Cypress Automation Project using copilot

In the next steps, we will create a Cypress automation framework to automate UI tests for the Flask routes in the `specs.md` file. But before that, we need to add these new routes from `specs.md` into `app201.py`.

1. To do this, open app201.py in the editor along with specs.md, and enter the following prompt:

```console
Add new routes to app201.py based on the specifications in specs.md. Keep the existing cat() function structure, but update the cat data according to the specifications file
```

2. Update `build_routes()` in `app201.py` with the results provided by Copilot Chat, which will look similar to this:

```python
def build_routes():

    app = Flask(__name__)

    @app.route('/201')
    def hello201():
        return "Hello, course 201!"

    @app.route('/201/cat')
    def cat():
        data = {
            "name": "Whiskers",
            "breed": "Maine Coon",
            "age": 5,
            "color": "Brown"
        }
        response = jsonify(data)
        response.headers.add('Access-Control-Allow-Origin', '*')
        return response

    @app.route('/201/dog')
    def dog():
        data = {
            "name": "Buddy",
            "breed": "Golden Retriever",
            "age": 5,
            "color": "Golden"
        }
        response = jsonify(data)
        response.headers.add('Access-Control-Allow-Origin', '*')
        return response

    @app.route('/201/rabbit')
    def rabbit():
        data = {
            "name": "Thumper",
            "breed": "Holland Lop",
            "age": 2,
            "color": "Brown"
        }
        response = jsonify(data)
        response.headers.add('Access-Control-Allow-Origin', '*')
        return response

    return app
```

We updated our application with the routes from the `specs.md` file. Let's now create a new Cypress project from scratch.

3. To create a new Cypress project with some test cases already defined, use the following prompt:

```console
@workspace /new As a Senior Test Automation Engineer, create a new project called "cypress-demo" and develop tests in that Cypress project for all routes in app201.py. Use Cypress version 13.8.0. Starting from version 10, Cypress has a different folder structure, including e2e instead of integration. Set the baseUrl to http://127.0.0.1:5000.
/201/cat - asserts json object data for a cat.
{
            "name": "Whiskers",
            "breed": "Maine Coon",
            "age": 5,
            "color": "Brown"
        }
/201/dog - asserts json object data for a dog.
{
            "name": "Buddy",
            "breed": "Golden Retriever",
            "age": 5,
            "color": "Golden"
        }
/201/rabbit - asserts json object data for a rabbit.
{
            "name": "Thumper",
            "breed": "Holland Lop",
            "age": 2,
            "color": "Brown"
        }
Keep test data in fixtures
Utilize mochawesome version 7.1.3 for reporting. Update the README with instructions on how to set up Cypress locally on a Mac and how to execute the tests.
```

4. Review the project structure proposed by Copilot and click on the "Create New Workspace" button. Select the location of the Cypress demo project in the file explorer so that it is under the `c201/qa` folder. This will create the new workspace in VSCode. Please close it and reopen the Copilot Workshop folder in VSCode. Your new Cypress demo project should be in the `c201/qa` directory.
   Going forward, you can use your `cypress-demo` project or the `cypress-example` we already created using the same prompt.
5. Open the README.md file under your Cypress project and follow the instructions to install the project dependencies. Navigate to the `cypress-demo` (or `cypress-example`) project and run:

```bash
npm install
```

6. After the dependencies are installed, make sure the Flask application is still running on localhost port 5000, and run: `npx cypress run` to execute the tests in headless mode.

All Test should pass - if not utilize Copilot Chat to debug.

### Debug the Cypress automation test error using Copilot

At this point we already used Copilot ot debug Cypress test runtime errors. But let's do it one more time.

1. Let's introduce a test error. Open the `app201.py` file in the `c201/src` directory, update the cat color to black, and save your changes. Your cat data should look like this:

```python
def cat():
        data = {
            "name": "Whiskers",
            "breed": "Maine Coon",
            "age": 5,
            "color": "Black"
        }
        response = jsonify(data)
        response.headers.add('Access-Control-Allow-Origin', '*')
        return response
```

Navigate to copilot_training/c201/qa/cypress-example and run the Cypress test in the terminal using: `npx cypress run`. Your test should fail with an error, as the assertion for the cat data object no longer matches.

```console
 1) App201 Routes
       /cat - asserts json object data for a cat:

      AssertionError: expected { Object (age, breed, ...) } to deeply equal { Object (name, breed, ...) }
      + expected - actual

      -{ age: 5, breed: 'Maine Coon', color: 'Black', name: 'Whiskers' }
      +{ name: 'Whiskers', breed: 'Maine Coon', age: 5, color: 'Brown' }
```

2. To find the reason for an error and ask Copilot Chat to fix it, there are a few ways to do that. You can select an error in the terminal and use the `#terminalSelection` command to explain the error. To do this, select the error in the terminal, then type `#terminalSelection` in the chat window and hit Enter.
   Copilot will explain the error, but it might not provide the exact solution since it lacks context on where the JSON object is defined.

```console
The error message indicates that the Cypress test is failing because the expected cat data object does not match the actual cat data object returned by the API. Specifically, the color property is different ('Black' vs 'Brown').
```

Let's use the @workspace agent to get the exact location of the file we need to fix. Type the following prompt in the chat window:

```console
@workspace Where is the JSON object data defined and how can I fix it?
1) App201 Routes
       /cat - asserts json object data for a cat:
      AssertionError: expected { Object (age, breed, ...) } to deeply equal { Object (name, breed, ...) }
      + expected - actual
      -{ age: 5, breed: 'Maine Coon', color: 'Black', name: 'Whiskers' }
      +{ name: 'Whiskers', breed: 'Maine Coon', age: 5, color: 'Brown' }
```

In our case, Copilot responded with the data file we need to fix:

```json
Update copilot_training/c201/qa/cypress-example/cypress/fixtures/cat.json to:
{
    "name": "Whiskers",
    "breed": "Maine Coon",
    "age": 5,
    "color": "Black"
}
```

Proceed with the fix and run the test again using: `npx cypress run`. Now, all tests should pass.

That concludes the final demo, where we demonstrated how to create a new Cypress project, develop test automation according to the specs, and fix test runtime errors.

### Wrap up

This completes the hands-on section of this workshop. You've successfully tried a number of Copilot features including writing tests, documentation and adding new features.
