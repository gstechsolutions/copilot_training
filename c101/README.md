# 101: GitHub Copilot Fundamentals Training

_Pre-requisite: Before starting the training, please make sure you have the necessary environment setup as mentioned in [SETUP.md](../setup/SETUP.md)._

## Introduction

The following training is delivered live alongside a set of accompanying slides. However, this training can also be performed in a non-live setting, by following the instructions in this file, or by watching a recording of the live training session.

The Copilot 101 training covers the following topics:

- [101: GitHub Copilot Fundamentals Training](#101-github-copilot-fundamentals-training)
  - [Introduction](#introduction)
  - [Module 1 - Copilot Overview](#module-1---copilot-overview)
    - [Objective](#objective)
    - [Copilot Overview](#copilot-overview)
  - [Module 2 - Copilot, Copilot Chat \& Copilot Edits Interaction](#module-2---copilot-copilot-chat--copilot-edits-interaction)
    - [Objective](#objective-1)
    - [Getting Started with Copilot](#getting-started-with-copilot)
    - [Getting Started with Copilot Chat](#getting-started-with-copilot-chat)
    - [Getting Started with Copilot Edits](#getting-started-with-copilot-edits)
  - [Module 3 - Prompt Engineering](#module-3---prompt-engineering)
    - [Objective](#objective-2)
    - [Prompt Engineering](#prompt-engineering)
    - [Using Zero-Shot prompt to generate a Unit test for the Flask application](#using-zero-shot-prompt-to-generate-a-unit-test-for-the-flask-application)
    - [Building JavaScript with One-Shot Programming](#building-javascript-with-one-shot-programming)
  - [Module 4 - Copilot Best Practices](#module-4---copilot-best-practices)
    - [Objective](#objective-3)
    - [Best Practices](#best-practices)
  - [Module 5 - Tips and Tricks](#module-5---tips-and-tricks)
    - [Objective](#objective-4)
    - [Tips and Tricks](#tips-and-tricks)
  - [Module 6 - Governance and Control](#module-6---governance-and-control)
    - [Objective](#objective-5)
    - [Governance and Control](#governance-and-control)
  - [Module 7 - Future Roadmap](#module-7---future-roadmap)
    - [Objective](#objective-6)
    - [Future Roadmap](#future-roadmap)
  - [Module 8 - FAQ](#module-8---faq)

Let's get started with an overview of Copilot.
<br/>
<br/>

## Module 1 - Copilot Overview

### Objective

This module provides an introduction to GitHub Copilot, exploring its features, capabilities, and limitations. By the end of this module, participants will be able to:

1. **Understand GitHub Copilot**: Gain insights into what GitHub Copilot is and its transformative impact on the software development process.
2. **Get Started with Copilot**: Learn the prerequisites for using Copilot, including supported IDEs and its key features.
3. **Identify Appropriate Use Cases**: Recognize tasks where Copilot excels, such as coding and unit testing, and understand its limitations, like handling non-coding tasks or processing production data.
4. **Explore the Chat Feature**: Discover where the Copilot chat feature is located in VS Code and understand its purpose, with a detailed exploration covered in subsequent modules.

### Copilot Overview

1. GitHub Copilot documentation can be obtained from: https://docs.github.com/en/copilot

2. GitHub is useful for a variety of technical roles including, but not limited to:

- Software Engineers
- DevOps Engineers
- Application Security Engineers
- QA Engineers
- DBAs

3. Key features include:

- Direct code writing
- IDE integration via plugins

4. Areas that Copilot is not a good fit for include:

- Non-coding tasks
- Generating production data
- Natural language generation such as would be done with ChatGPT

5. When you're using Copilot you can also leverage the chat feature to aid in:

- Natural language assistance to software development questions
- Learning more about techniques related to the language you are working with
- Using the chat window as a pair-programmer/collaborator

6. A number of use cases are explored in this workshop, where we will be focusing on the Python programming language, these include:

- Using Copilot for Python coding examples
- Generating Unit Tests
- Translating Python 2.x to 3.x

7. Let's now move onto the getting started session.

<br/>
<br/>

## Module 2 - Copilot, Copilot Chat & Copilot Edits Interaction

### Objective

This module aims to provide a hands-on understanding of how to use GitHub Copilot, Copilot Chat, and Copilot Edits. By the end of this module, participants will be able to:

1. Use inline suggestions and completions in their IDE with GitHub Copilot.
2. Interact with Copilot Chat for advanced code explanations and error resolutions.
3. Leverage Copilot Edits to perform edits across multiple files using natural language prompts.

Repo setup was covered as a prerequisite prior to the class. See SETUP.md for details.

Now you can try a few commands to get a feel for how Copilot works.

### Getting Started with Copilot

Let's try Copilot first:

1. **Get Inline Suggestions:**  
   Start typing code in your IDE, and GitHub Copilot will offer suggestions in gray ghost text to complete lines or even suggest full blocks. Accept a suggestion by pressing Tab.

2. **Open the Completions Panel:**  
   For additional suggestions, press **Ctrl+Enter** (includes Windows, Linux, and MacOS) to open the completions panel, where you can see and select alternative suggestions in a separate pane.

3. **Use the /fix Command to Address Issues:**  
   To demonstrate the `/fix` command, introduce a syntax error in the following code:

   ```python
   def build_routes():
       app = Flask(__name__
   ```

   This missing parenthesis causes an error. Right-click on the code, select "Copilot" > "Fix This," and Copilot will suggest a correction for the error.

4. **Ask Copilot to Explain Code:**
   To understand a code section, right-click, select "Copilot" > "Explain This," and Copilot will generate an explanation.

Next let's use the chat window to try:

### Getting Started with Copilot Chat

1. **Saying Hello:**  
   Start your interaction by typing "Hello, Copilot!" in the chat window to initiate a conversation and set a friendly tone for your queries.

2. **Checking its Limits:**  
   Ask questions like `"What can you help me with?"` or `"What are your limitations?"` to understand the boundaries of GitHub Copilot Chat's capabilities and the types of coding-related inquiries it can address.

3. **Testing its Knowledge:**  
   Pose specific coding questions or challenges, such as `"Can you explain how to implement a binary search in Python?"` This will allow you to gauge Copilot Chat's understanding of programming concepts and its ability to provide accurate information.

4. **Using the Topics Command:**  
   Type a slash (/) in the chat window to see a list of supported slash commands, such as `/explain`, `/fix`, or `/clear`. These commands facilitate specific tasks and help streamline your interactions with Copilot Chat.

5. **Exploring the Copilot Chat Participant Feature:**  
   To explore the Copilot chat participant feature, type `@` in the chat prompt box to see a list of all available chat participants. Select the chat participant you want to use, or type the full slug name of the chat participant, followed by your prompt.

### Getting Started with Copilot Edits

Here are some instructions on how to interact with Copilot Edits:

- **Starting a Code Editing Session:**  
  To begin, press **Shift+Cmd+I** (macOS) to open Copilot Edits, or select "Open Copilot Edits" from the Top Level Copilot menu. You can then add the relevant files to the working set to let Copilot know which files to edit.

- **Entering a Prompt for Edits Across Multiple Files:**  
  In the chat prompt, describe the changes you want to make across multiple files. For example, you might ask Copilot to "add a default route for app101.py and app201.py" and add those files.

- **Reviewing and Iterating on Changes:**  
  Copilot will apply the suggested edits directly in the editor. You can review the changes and continue refining them with Copilot through a multi-turn chat conversation.

That's the basics!
If you would like to use shortcut keys to open many of the options we just explored, the official GitHub Copilot page documents them for each operating system supported:

https://docs.github.com/en/copilot/configuring-github-copilot/configuring-github-copilot-in-your-environment

## Module 3 - Prompt Engineering

### Objective

This module focuses on the art of crafting effective prompts to maximize Copilot's capabilities. By the end of this module, participants will be able to:

1. Utilize zero-shot, one-shot, and few-shot prompt engineering techniques.
2. Generate and refine unit tests and code using targeted prompts.
3. Develop strategies for building applications and debugging with Copilot assistance.

### Prompt Engineering

There are three key methods we can use Prompt Engineering to generate code in Copilot. These are:

1. Zero-Shot prompting. For example asking Copilot to generate a set of unit tests for all the code in a target file

2. One-Shot prompting. Asking Copilot to generate unit tests for all the code in a file, and seeding it with an example.

3. Few-Shot prompting. Similar in approach to One-Shot prompting, but here we provide multiple examples.

### Using Zero-Shot prompt to generate a Unit test for the Flask application

In your IDE, we are now going to ask Copilot to generate Unit Tests. Let's start with some Python code.

1. Open the `c101 > src > app101.py`.

2. Next, open the chat window. Once open, select the `def build_routes():` function in `app101.py`.

3. In the chat window type the following prompt:

```console
Write me a unit test for the highlighted code
```

You should now see some code similar to the following generated in the window:

```python

import unittest
from flask import Flask
from c101.src.app101 import build_routes


class TestApp101(unittest.TestCase):

    def setUp(self):
        self.app = build_routes()
        self.client = self.app.test_client()

    def test_hello101_route(self):
        response = self.client.get('/101')
        self.assertEqual(response.data, b"Hello, course 101!")

if __name__ == '__main__':
    unittest.main()
```

4. In the tests folder located at `copilot_training/tests/`, create new file called `test_app101.py` and copy the above code from the Copilot chat window into this new file and save the file.

5. To check if our Unit test works run the following command from the terminal from the `copilot_training`directory of the cloned repository:

```console
python3 -m unittest discover tests
```

The test should run and output something similar to:

```python

..
----------------------------------------------------------------------
Ran 2 tests in 0.009s

OK
```

Did you hit any issues with the code generated by Copilot? If so, see if you can use Copilot to debug the situation. If you get stuck and want to move on, use the example Unit test from above.

So, here we have seen how we can use a Zero-Shot prompt to generate a Unit test for the Flask application that serves up web content.

Let's now take a look at building some JavaScript with One-Shot programming

### Building JavaScript with One-Shot Programming

1. In `c101 > src` let's create a folder called `static`

2. Now, in `c101 > src > static` let's create a new file called `App.jsx` We will use this file to test the concept of One-shot programming with Copilot.

3. Open the `Chat` window and enter the following prompt:

```console
Write me a simple set of React components to display "Hello course 101!" Use the following example: `return <h2>{courseName}</h2>`
```

Copilot will generate some code similar to the following:

```javascript
// App.jsx

import React from 'react';

// Named constant for the course name
const COURSE_NAME = "course 101";

/**
 * Functional component to display the course name.
 *
 * @returns {JSX.Element} The JSX code to display the course name.
 */
function CourseName() {
    return <h2>{COURSE_NAME}</h2>;
}

/**
 * Main App component.
 *
 * @returns {JSX.Element} The JSX code for the main App component.
 */
function App() {
    return (
        <div>
            <h1>Hello</h1>
            <CourseName />
        </div>
    );
}

export default App;
```

4. Copy the above code over to the `App.jsx` file you created, and save the file.

5. We now need to add this to our `c101` route we created in Flask. Let's ask Copilot how we can do this. Try the following prompt:

```console
How can I have my Flask route in app101.py render this React component?
```

Copilot should now present a set of steps including using vite, how to build the React application to static files and then serve these static files using Flask.

6. Let's take this first piece of advice and create the React application with vite.

7. In the terminal navigate into the `c101 > src > static` folder and run the following command:

```console
npm create vite@latest c101 -- --template react
```

> [!TIP]
> Note that in npm 7+, the double-dash is required but may not be the same suggested command by GitHub Copilot.

> [!WARNING]
> If the command throws an error, please check to confirm that NodeJS is installed by running the following command from the terminal: node -v
> If NodeJS is not installed please install it.

Once this has finished running you should see `Happy hacking!` in the terminal.

8. Move your `App.jsx` file (was created in step 2) to the `c101/src` using the following command:

```console
mv App.jsx c101/src
```

9. Let's move onto building our React app. Copilot will first tell you to install the dependencies by running this command in the new `c101` folder that was created in Step #7:

```console
npm install
```

10. We can see our React app with the App component that GitHub Copilot created by running:

```console
npm run dev
```

Open http://localhost:5173/ in your browser and you should see "Hello" and "course 101" on the page.

11. We can now move on to the next piece of advice that Copilot presented. This should be something similar to:

> Build the React App: Build your React app for production.

12. Let's go ahead and run the following command from the `c101/static/c101` directory:

```console
npm run build
```

You should see the `Compiled successfully.` displayed in the terminal when it completes.

13. Copilot will likely have also told you to move the `dist` folder you just created to the `static` directory. We can do this by executing the following command from `copilot_training/c101/src/static/c101`:

```console
mv dist ../
```

14. Let's switch back now to our `app101.py` file located at `copilot_training/c101/src/app101.py`.

15. Copilot has explained that we need to update our route to use the `index.html` file that was generated by the build. Select the line of code that says `return "Hello, course 101!"`

16. Right click on this line, and select from the menu `Copilot > Start Inline Chat` or `Copilot > Start in Editor`

17. In the inline editor, enter the following prompt:

```console
Update this line of code to return the static file `dist/index.html`
```

The code should update to:

```python
 return app.send_static_file('dist/index.html')
```

18. Select the `Accept button` and save the file.

This is the same as the advice that the Copilot chat window provided us.

Copilot chat also informed us that we need to ensure Flask can serve static content, you likely saw a suggestion similar to this:

```console
Also, make sure to configure Flask to serve the static files:

app = Flask(__name__, static_folder='static')
```

19. While this is useful advice, we need a bit more context on where to make this edit. So let's ask Copilot. Select all the code in app101.py and in the chat window enter the following prompt:

```console
Where should I enter the app = Flask(__name__, static_folder='static') in the highlighted code?
```

A response should now be generated with an explanation of where this code can be added:

> You should enter the `app = Flask(__name__, static_folder='static')` code in your build_routes function where you're creating your Flask application instance.

20. We can see in the code example generated that it recommends that we replace `app = Flask(__name__)` with `app = Flask(__name__, static_folder='static')` :

21. Let's go ahead and select `app = Flask(__name__)` right click, and from the Copilot menu select the `Fix this` option.

Copilot should now return a response that says something similar to:

> To fix the code, I would add the missing import statement for the `send_static_file` function from the `Flask` module.

22. If that is the message displayed, select the `Accept` button.

23. Now you will need to make those changes. So, let's copy over the code from the Copilot chat window, and replace the existing content with the new code containing the `static_folder` reference. To do so replace:

```python
app = Flask(__name__)
```

with

```python
app = Flask(__name__, static_folder='static')
```

OK, so we should now be ready to test this out.

24. Save the `index.html` file and from the `copilot_workshop` directory run the following command:

```console
export PYTHONPATH=$(pwd)
```

```console
course101
```

25. You can now navigate in your browser to:

```console
http://127.0.0.1:5000/101
```

Oh no, the page is blank! Why do you think this is?

26. Look at the errors in the page, you can see the paths to some of our static files are wrong. Well, Copilot can help us fix this issue and refactor our `index.html` to resolve it.

27. Leave the application running and return to the code editor.

Now we are going to update the `index.html` file so that the paths to Javascript files work when serving the content from Flask.

28. Open the `index.html` file at `copilot_training/c101/src/static/dist/index.html` and highlight all the code.

29. In the Copilot chat window, enter the following prompt:

```console
How do I update the paths so they work when this file is served up by a Flask route? The static files are located in a folder called /static/dist/assets/
```

You should now be presented with some refactored code. Copy and paste this over the existing code and save the file.

For example:

```html
<!doctype html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <link rel="icon" type="image/svg+xml" href="/vite.svg" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Vite + React</title>
  <script type="module" crossorigin src="static/dist/assets/index-DO1qKPjm.js"></script>
  <link rel="stylesheet" crossorigin href="static/dist/assets/index-kQJbKSsj.css">
</head>

<body>
  <div id="root"></div>
</body>

</html>
```

30. Now refresh your browser window where the Flask application is running.

Congratulations, you have now fixed the error and you should see:

```
Hello
course 101!
```

This wraps up the section on Prompt Engineering. Let's now look at some best practices that build upon the above.

## Module 4 - Copilot Best Practices

### Objective

This module emphasizes best practices for efficient and effective use of GitHub Copilot. By the end of this module, participants will be able to:

1. Create targeted and context-aware prompts for precise outputs.
2. Break down complex tasks into manageable steps for better results.
3. Implement systematic testing and refinement when using Copilot-generated code.

### Best Practices

There are a number of best practices which will improve your Copilot experience, these include:

- Narrow down your prompt to be targeted
- Include context, for example function names and comments
- Be efficient, write it clearly once
- The more information you provide Copilot, the better the output

In addition to the above, remember that it is good practice to provide reference text, such as highlighting a function when asking a question. This will reduce the chance of false answers being generated and will improve accuracy.

Another technique that can help is to split large tasks into smaller ones. The more complex the task, the greater the chance an error can creep in.

Finally, consider the following:

- Give Copilot time to think
- Provide Copilot with external links and tools to help improve results
- Test your changes systematically and remember to include tests.

Let's try some of these techniques out by expanding our application to create a simple calculator.

1. Open up the `app101.py` file located at `copilot_training/c101/src/app101.py`.

2. We are now going to add a new route to the file. Let's start by adding the following comment to the file above the line `return app`.

```python
# Add a new route under /101 for a calculator function
```

3. Highlight the comment and click the small icon with two stars next to the text.

The Copilot inline chat prompt will appear.

4. Enter the following:

```console
Generate calculator route and function
```

A new route and function will now be generated similar to the following. If the function was added below the `return app` line, move it above the `return app` line as follows:

```python
 @app.route('/101/calculator')
    def calculator():
        # Your calculator logic here
        return "Calculator page"

return app <---ABOVE THIS LINE
```

5. Save this change.

6. Now in your browser navigate to the following URL:

```console
http://127.0.0.1:5000/101/calculator
```

You should see the text:

`Calculator page`

This was a very simple example that we can now iterate on.

7. There should be a comment `# Your calculator logic here` located below `def calculator()`:

8. If for some reason Copilot did not create this comment in the example code, add it now.

9. Let's now select the whole def `calculator()` function:

```
def calculator():
   # Your calculator logic here
    return "Calculator page"
```

and open Copilot inline chat.

10. Enter the following prompt:

```console
Update this function signature to take 3 parameters. These are two numbers and a mathematical symbol.
```

11. Accept the suggestion, it should update the function to accept three parameters like the example below:

```python
def calculator(num1, num2, symbol):
```

12. Now select the comment and return statement:

```
  # Implement your calculator logic here
  return "Calculator route"
```

and open the Copilot inline chat.

13. Enter the following prompt:

```console
Use the function parameters and this comment to create code that performs a mathematical operation
```

A block of code similar to the following should be generated:

```python

        if symbol == '+':
            result = num1 + num2
        elif symbol == '-':
            result = num1 - num2
        elif symbol == '*':
            result = num1 * num2
        elif symbol == '/':
            result = num1 / num2
        else:
            return "Invalid symbol"

        return f"The result is: {result}"
```

14. Accept this. Remove the old return statement `return "Calculator page"` if it is still present.

15. Save the file.

At the moment our route does not accept any parameters. So let's make our next incremental change.

16. Open the Copilot chat window, and ask it the following question:

```console
How do I pass parameter into the @app.route('/101/calculator') route?
```

You should now see a response with an example:

```python
@app.route('/101/calculator/<int:num1>/<int:num2>/<string:symbol>')
def calculator(num1, num2, symbol):
    # Implement your calculator logic here
    if symbol == '+':
        result = num1 + num2
    elif symbol == '-':
        result = num1 - num2
    elif symbol == '*':
        result = num1 * num2
    elif symbol == '/':
        if num2 != 0:
            result = num1 / num2
        else:
            return "Cannot divide by zero"
    else:
        return "Invalid symbol"

    return f"The result is: {result}"
```

So we can now update our route to follow this format.

17. Select `@app.route('/101/calculator')` open the inline chat and enter the following prompt:

```console
Update the route to use the three parameters in the calculator function
```

18. Accept the suggestion and the route should be updated to:

```python
 @app.route('/101/calculator/<int:num1>/<int:num2>/<string:symbol>')
```

19. Save the file and switch back to your browser.

20. Test the calculator function with the following URL:

```console
`http://127.0.0.1:5000/101/calculator/1/2/+`
```

The output should be `3`

So in this small demo we saw how we can use best practices or small incremental changes to build a very simple calculator app.

Let's now look at some simple tips and tricks that build on this code.

## Module 5 - Tips and Tricks

### Objective

This module covers advanced tips and tricks to enhance productivity with GitHub Copilot. By the end of this module, participants will be able to:

1. Use Copilot to simulate specific engineering roles and solve domain-specific problems.
2. Optimize workflows with Copilot's features for testing, refactoring, and documentation.
3. Manage token limitations effectively by structuring tasks efficiently.

### Tips and Tricks

When writing prompts, remember to think step by step. You can even include a request for this within the prompt.

As we saw at the start of this course, you can also use Copilot chat to generate Unit tests. As an extra experiment, you can take our new calculator function and generate a Unit test!

We also saw how we can refactor code. This includes translating Python 2.x code to 3.x for example. In our next demo we will give this a try.

Another great feature of Copilot is the ability to think at a project level. Copilot can help bootstrap a new project and we saw an example of this with adding the React code.

If you want to simulate the experience of an engineer with specific skill sets when generating code we can tailor our prompts using roles. For example we can ask Copilot to pretend to be a frontend engineer and provide guidance on utilizing the React framework.

Remember that Copilot has a token limit, so break down tasks into smaller concise prompts.

Finally Copilot is exactly that, a Copilot not Autopilot, so check for hallucinations.

Now let's move onto our next demo and generate a rock paper scissors endpoint that uses some of these tricks.

Open up the `app101.py` file from `copilot_training\c101\src\app101.py`.

Let's start by asking Copilot chat the following question:

```console
As a Python engineer using Flask how would I add a rock paper scissors game function. Explain step by step
```

Copilot will return with a suggestion for adding a route and function. This suggestion also includes the import of necessary libraries, in our case, `random` and `jsonify`. You may receive different types of implementations: a single function containing all the logic, or multiple functions, one for the game and another to play the game. For simplicity, we will follow the implementation described here.

Let's start by adding new import statements at the top of the `app101.py` file: `import random` just below `from flask import Flask`. Also, add `jsonify` to the Flask import: `from flask import Flask, jsonify`. Your import statement should look like this:

```
from flask import Flask, jsonify
import random
```

Then, add the suggested function, which defines the game logic, just below the import statement (below `import random`).

```python
def play_rps(player_choice):
    choices = ['rock', 'paper', 'scissors']
    computer_choice = random.choice(choices)

    if player_choice == computer_choice:
        return 'Tie'
    elif (player_choice == 'rock' and computer_choice == 'scissors') or \
         (player_choice == 'scissors' and computer_choice == 'paper') or \
         (player_choice == 'paper' and computer_choice == 'rock'):
        return 'Player wins'
    else:
        return 'Computer wins'
```

Save the file.

Finally, we can add our new route and function. This function accepts the player's choice as a parameter from the route and calls our `play_rps` function. Place this just above the `return app` line, ensuring it's indented the same as other routes. If Copilot did not include `101/` in the route path, make sure to add it.

```python

@app.route('/101/rps/<player_choice>')
def rps_game(player_choice):
    result = play_rps(player_choice)
    return jsonify(result=result)

```

As explained by Copilot chat, we can now play the game by accessing the new route and passing in either 'rock', 'paper', or 'scissors'. Try playing the game by visiting http://localhost:5000/101/rps/rock, http://localhost:5000/101/rps/paper, or http://localhost:5000/101/rps/scissors in your web browser.

You should see a calculated response similar to the following depending on if you won or lost:

```javascript
{
  "result": "Player wins"
}
```

OK great, we have a basic game in place. Let's make the response a little more interesting.

Go back to `def play_rps(player_choice)` and select the row with the `return 'Player wins'` statement.

Open up the Copilot inline chat and prompt it with:

```console
Rewrite the response to be more interesting
```

Let it generate a response. Disregard the first response and have it generate another using the circular arrow icon.

Accept this change. You may see something similar to:

```python
return f'Player wins! You chose {player_choice} and the computer chose {computer_choice}.'
```

So here we can see that we can iterate through suggestions until we find one we like.

Reload the tab with your application in the browser. If the player wins, the more interesting response should now be present.

As we saw when starting out, we can easily write Unit tests for this code. Select the whole `def play_rps(player_choice):` function.

Right click on this and select the Copilot menu. From under the sub menu select `Generate tests`. Copilot suggested tests.
Click `Accept`.

If you navigate to the `tests > test_app101.py` file you should see it has been updated.

We now have new Unit tests for the functions we added.

If the modified file still contains the old `TestApp101` class and import statements, you can delete these.
check your import for `app101` should look like `from c101.src.app101 import play_rps`.

Save the file and let's give it a quick test.

From the command line in the root of the cloned repository, run the test command we used earlier:

```console
python3 -m unittest discover tests
```

Or, depending on your configuration, you can use:

```
python -m unittest discover tests
```

Our tests will now execute. Due to the pseudo-random nature of the responses from the `play_rps` function. Some tests will randomly fail.

As a future exercise, think about how you could improve this Unit test.

Let's now generate some documentation for this code. There are a couple of techniques we can use.

First, in `app101.py` select the `def play_rps` function.

Right click on the highlighted text, select Copilot and then `Generate Docs`.

Copilot will now update the Python function to include a doc string. For example:

```python
def play_rps(player_choice):
    """
    Play a game of Rock-Paper-Scissors against the computer.

    Parameters:
    player_choice (str): The player's choice of 'rock', 'paper', or 'scissors'.

    Returns:
    str: The result of the game. Possible values are 'Tie' if it's a tie,
         'Player wins! You chose [player_choice] and the computer chose [computer_choice].'
         if the player wins, and 'Computer wins' if the computer wins.
    """
```

For now let's use the `Discard` button. You will see when you click this it removes the suggested code. Did you notice when we used this approach, Copilot ran a slash command? This is where it inserts `/doc` automatically into the inline prompt field. You can try this for yourself. With the function code still highlighted, open the inline Copilot prompt entry field and type `/doc`.

You will see that Copilot generated a docstring very similar to the previous one. Once again reject this suggestion.

There is also another approach we can use to generate docs. Select all of the code in the file and then in Copilot chat enter the following prompt:

```console
Write some documentation for each function highlighted. This should be in markdown (.md) format.
```

Copilot will now generate documentation including a mix of plain text and markdown.

The following snippet demonstrates this output:

> Sure, here's a brief documentation for each function in the selected code:
>
> - `play_rps(player_choice)`: This function implements the game logic for Rock, Paper, Scissors. It takes the player's choice as an argument, randomly selects the computer's choice, and determines the winner based on the rules of the game. It returns a string indicating the result of the game.
>
> ### Function: play_rps(player_choice)
>
> This function implements the game logic for Rock, Paper, Scissors.
>
> **Arguments:**
>
> - `player_choice`: A string that represents the player's choice. It should be one of 'rock', 'paper', or 'scissors'.
>
> **Returns:**
>
> A string that indicates the result of the game.

So there is a key difference between these two approaches. With the Copilot chat option, you will have noticed the docstring is not automatically appended to the function. Therefore if you want to include inline docs, make sure you use the slash command `/doc` or the menu option!

As a final experiment, let's ask us how many tokens Copilot is limited to.

In the prompt window enter the question:

```console
What is your token limit?
```

You will now see that Copilot responds with content similar to the following:

> As an AI developed by OpenAI, I don't have a specific token limit for a single response. However, the model that powers me, GPT-4, has a maximum context window of 4096 tokens. This means that it can consider up to 4096 tokens of input when generating a response. If a conversation has more than 4096 tokens, the model will only consider the most recent 4096 tokens. Please note that a token can be as short as one character or as long as one word.

So here we can see if we ask very complex questions or provide large inputs, then the result might not be what you expect!

Let's find out how many tokens are in our `app101.py` file.
Highlight the code in `app101.py` and ask Copilot chat with this prompt:

```console
How many tokens are in the highlighted code?
```

You should see a response similar to this:

> The highlighted Python code contains 204 tokens. Tokens in Python code can be words, numbers, operators, or other syntax elements. For example, in the line from flask import Flask, jsonify, "from", "flask", "import", "Flask", and "jsonify" are each considered a token, as are the spaces and the newline character at the end of the line.

Congratulations, you've just experimented with tips and tricks. Let's now look at Governance and Control.

## Module 6 - Governance and Control

### Objective

This module provides an overview of governance and control mechanisms for GitHub Copilot. By the end of this module, participants will be able to:

1. Understand enterprise-level policies for managing Copilot access and usage.
2. Configure security and privacy settings, including public code filtering.
3. Utilize the Copilot Trust Center for insights on compliance and data governance.

### Governance and Control

Copilot supports a number of business controls including:

1. It is easy to assign users, and migration support is built in
2. Policy controls exist at the enterprise and organizational level
3. Public code matches can be filtered out/blocked.

You can also limit copilot by disabling it locally.

Don't forget to check out the copilot trust center for information on a variety of topics around security and privacy among others.

https://resources.github.com/copilot-trust-center/

## Module 7 - Future Roadmap

### Objective

This module outlines the upcoming features and developments in GitHub Copilot. By the end of this module, participants will be able to:

1. Identify new Copilot features, such as Copilot for Workspaces and Autofix.
2. Understand how these advancements can enhance their development workflows.

### Future Roadmap

This 101 course has touched on the basics of Copilot however new features are constantly being added to the platform.

This includes:

1. Copilot for workspaces
2. Autofix, which combines the power of Copilot and GitHub Advanced Security

## Module 8 - FAQ

Refer to the accompanying slides for more information on frequently asked questions.
