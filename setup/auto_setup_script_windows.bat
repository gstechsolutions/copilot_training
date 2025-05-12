@echo off
setlocal

REM Display a help message if the user requests it
if "%~1"=="-h" (
    echo Usage: %~nx0 [giturl]
    echo Clone the specified Git repository and set up a Python virtual environment.
    echo Example: %~nx0 https://github.com/tweag/copilot_training.git
    exit /b 0
)

REM Check if giturl is provided
if "%~1"=="" (
    echo Error: Please provide a Git URL.
    echo Usage: %~nx0 [giturl]
    exit /b 1
)

REM Set giturl variable
set "giturl=%~1"

REM Check for node
echo Checking for node...
node --version >nul 2>&1
if %errorlevel% neq 0 (
    echo node is not installed. Please install Node.js from https://nodejs.org/en/download/
    exit /b 1
) else (
    echo node is installed.
)

REM Check for python
echo Checking for python...
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo python is not installed. Please install Python from https://www.python.org/downloads/
    exit /b 1
) else (
    echo python is installed.
)

REM Check for pip
echo Checking for pip...
pip --version >nul 2>&1
if %errorlevel% neq 0 (
    echo pip is not installed. 
    echo Please install Python and pip from https://www.python.org/downloads/
    echo After installation, please rerun this script.
    pause
    exit /b 1
) else (
    echo pip is installed.
)

REM Create a new folder called copilot_workshop
if not exist "copilot_workshop" (
    echo Creating a new folder called copilot_workshop...
    mkdir "copilot_workshop" || (
        echo Failed to create directory copilot_workshop.
        pause
        exit /b 1
    )
) else (
    echo Folder copilot_workshop already exists.
)

REM Remove the read-only attribute from copilot_workshop
echo Removing read-only attribute from copilot_workshop...
attrib -R "copilot_workshop" || (
    echo Failed to remove read-only attribute from copilot_workshop.
    pause
    exit /b 1
)


REM Change to the copilot_workshop directory
echo Changing to the copilot_workshop directory...
cd "copilot_workshop" || (
    echo Failed to change directory to copilot_workshop. Make sure the directory exists and you have the necessary permissions.
    pause
    exit /b 1
)

REM Print the current directory
echo Current directory: %cd%


REM Check if copilot_training directory already exists
if exist "copilot_training\" (
    echo Error: Directory 'copilot_training' already exists. Please delete it or move to another directory before running this script.
    pause
    exit /b 1
)

REM Clone the repository
echo Cloning the repository...
git clone %giturl% || (
    echo Failed to clone the repository.
    exit /b 1
)

REM Set up a virtual environment
echo Setting up a virtual environment...
python -m venv .venv || (
    echo Failed to create virtual environment.
    exit /b 1
)

REM Activate the virtual environment
echo Activating the virtual environment...
call .venv\Scripts\activate || (
    echo Failed to activate virtual environment.
    exit /b 1
)

REM Upgrade pip
echo Upgrading pip...
pip install --upgrade pip || (
    echo Failed to upgrade pip.
    exit /b 1
)

REM Check installation is working
echo Checking python and pip versions...
python --version || (
    echo Failed to check python version.
    exit /b 1
)
REM Check if pip3 is available
where pip3 >nul 2>nul
if %errorlevel% equ 0 (
    set pip_cmd=pip3
) else (
    set pip_cmd=pip
)

REM Check pip version
echo Checking %pip_cmd% version...
%pip_cmd% --version || (
    echo Failed to check pip version.
    exit /b 1
)

REM Install the repository using pip
echo Installing the repository using %pip_cmd%...
%pip_cmd% install -e copilot_training || (
    echo Failed to install the repository.
    exit /b 1
)

REM Set PYTHONPATH for the installed repository
echo Setting PYTHONPATH for the installed repository...
set PYTHONPATH=%CD%
setx PYTHONPATH "%CD%" || (
    echo Failed to set PYTHONPATH.
    exit /b 1
)

REM Open a new PowerShell window, cd into "copilot_workshop", and activate the venv
echo Opening a new PowerShell window...
start powershell -NoExit -Command "cd %CD%; .\.venv\Scripts\activate"


echo "Setup completed successfully. The virtual environment is activated, and the repository is installed and added to PYTHONPATH."
endlocal
