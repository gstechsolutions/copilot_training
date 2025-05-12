# Windows manual setup
Before proceeding with the creation of a local development environment please make you have completed the initial steps mentioned in [SETUP.md](./SETUP.md), including forking the copilot training repo (see [repo_forking_and_cloning.md](./repo_forking_and_cloning.md)) or unzipping ZIP file with training materials (see [repo_setup_with_zip_file.md](./repo_setup_with_zip_file.md))

**NOTE:** Execute the steps below from the `copilot_workshop` directory, which is the parent of your `copilot_training` repository.
### 1. Open a Command Prompt window.
To open a Command Prompt window on Windows:

Press `Win + R` to open the Run dialog.
Type `cmd` and press Enter or click OK.
This window is where you'll execute the setup commands and configure your Python environment.

### 2. Create a virtual environment
Run the following command to set up a virtual environment. This isolates your project's dependencies, allowing you to install packages specific to this workshop without affecting your system's global Python installation:

```console
py -3 -m venv .venv
```

### 3. Activate the virtual environment 
After creating the environment, activate it to start using it. This step ensures that all packages installed are confined to this environment:

```console
.venv\Scripts\activate
```

### 4. Install the workshop code and Flask
With the environment activated, install the necessary packages, including the workshop code and Flask, by running:

```console
pip install -e copilot_training
```

### 5. Set the PYTHONPATH environment variable
To ensure your project files can be located correctly, you need to set the `PYTHONPATH`. Run the following command to set the `PYTHONPATH` to the current directory:

If you are using command prompt execute the following

```console
setx PYTHONPATH %cd%
```
or un the following command, replacing `<path to copilot_workshop directory>` with the actual path to your project directory:
```console
setx PYTHONPATH "<path to copilot_workshop directory>"
```

if you are using powershell use the following

```console
setx PYTHONPATH $PWD
```

### 6. Exit and restart the Command Prompt window
To ensure the `PYTHONPATH` changes take effect, exit and restart the Command Prompt window.

To Verify in PowerShell
```console
echo $env:PYTHONPATH
```

To Verify in Command Prompt
```console
echo %PYTHONPATH%
```

**NOTE:** Make sure you are in the `copilot_workshop` directory, which is the parent of your `copilot_training` repository.

### 7. Reactivate the virtual environment
After restarting the Command Prompt, reactivate your virtual environment by running:

```console
.venv\Scripts\activate
```

### 8. Test the course installation
Run the following command to verify that the course has installed successfully:

```console
course101
```

You should see output similar to the following in the terminal. If you do, proceed to step 10:

```console
 * Serving Flask app 'copilot_training.c101.src.app101'
 * Debug mode: on
WARNING: This is a development server. Do not use it in a production deployment. Use a production WSGI server instead.
 * Running on http://127.0.0.1:5000
Press CTRL+C to quit
 * Restarting with stat
 * Debugger is active!
 * Debugger PIN: 123-456-789
127.0.0.1 - - [08/May/2024 16:48:07] "GET /101 HTTP/1.1" 200 -

```

### 9. Resolve `ModuleNotFoundError` if necessary
If you do not see the above expected result in the terminal window but see an error similiar to `ModuleNotFoundError: No module named 'copilot_training'` you may need to add the PYTHONPATH variable manually as follows: <br> <br>
1. Open the `Environment Variables` dialog on your machine <br>
2. Click `New` to create a new User variable <br>
3. Enter `PYTHONPATH` in the `Variable name:` field <br>
4. Enter the path to the `copilot_workshop` in the `Variable value:` field <br>
5. Click `OK` to close all `Environment Variables` dialogs <br>
6. Start at `step 6.` again


### 10. Verify the application in your browser
In your browser, navigate to:

```console
http://127.0.0.1:5000/101
```

You should see the following text displayed in the browser:

```console
Hello, course 101
```

You are now ready for the workshop!

# Window installs script (beta)
! **Not applicable for setup via a ZIP file**

A batch script, `auto_setup_script_windows.bat`, is included in this repository. This script automates the installation of the application.

Please remove the `copilot_training` directory if it already exists. The script will clone the latest version of the repository for you.

You can run this script using the following command:

```console
.\auto_setup_script_windows.bat <your-training-repo-giturl>
```
Example: `.\auto_setup_script_windows.bat https://github.com/tweag/copilot_training.git`

During the installation, the batch script checks if all necessary libraries are installed, and activates your virtual environment in the copilot_workshop directory. It also sets the PYTHONPATH to point to the copilot_workshop directory.

After the setup is completed, a PowerShell window will open for you.

1. Run the following command to test that the course has installed successfully. Replace `<course_number>` with the number of your course (e.g., `101`, `201`):

```console
course<course_number>
```

For example, if you are taking course 101, you would run `course101`. If you are taking course 201, you would run `course201`.

You should see something similar to the following:

```console
 * Serving Flask app 'copilot_training.c101.src.app101'
 * Debug mode: on
WARNING: This is a development server. Do not use it in a production deployment. Use a production WSGI server instead.
 * Running on http://127.0.0.1:5000
Press CTRL+C to quit
 * Restarting with stat
 * Debugger is active!
 * Debugger PIN: 123-456-789
127.0.0.1 - - [08/May/2024 16:48:07] "GET /101 HTTP/1.1" 200 -

```

2. In your browser navigate to: 

```console
http://127.0.0.1:5000/101
```

You should see the following text displayed in the browser:

```console
Hello, course 101
```

That's the basics, and our application installed.

3. After you're done with training, deactivate the virtual environment:

```console
deactivate
```





