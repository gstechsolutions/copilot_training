#!/bin/bash

# Display a help message if the user requests it
if [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
  echo "Usage: `basename $0` [giturl]"
  echo "Clone the specified Git repository and set up a Python virtual environment."
  echo "Example: `basename $0` https://github.com/tweag/copilot_training.git"
  exit 0
fi

# Check if giturl is provided
if [ -z "$1" ]; then
  echo "Error: Please provide a Git URL."
  echo "Usage: `basename $0` [giturl]"
  exit 1
fi

# Mac install

giturl=$1

# Check Python version
python_version=$(python3 --version)
if [[ $python_version != Python\ 3* ]]; then
    echo "Error: Python 3 is not installed."
    exit 1
else
    echo "Python version: $python_version"
fi

# Check pip version
if command -v pip3 &> /dev/null
then
    pip_version=$(pip3 --version)
    echo "pip version: $pip_version"
else
    echo "pip3 is not installed. Installing..."
    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
    python3 get-pip.py
    rm get-pip.py
    pip_version=$(pip3 --version)
    echo "pip version: $pip_version"
fi

# Check Node.js version
node_version=$(node --version)
if [[ $node_version < v14* ]]; then
    echo "Error: Node.js is not installed or not up-to-date."
    exit 1
else
    echo "Node.js version: $node_version"
fi

# Check if copilot_workshop directory already exists
if [ -d "copilot_workshop" ]; then
    echo "Directory 'copilot_workshop' already exists. Changing to 'copilot_workshop' directory."
    cd copilot_workshop
else
    # Create a new folder called copilot_workshop
    echo "Creating 'copilot_workshop' directory."
    mkdir copilot_workshop

    # Check if the directory was created successfully
    if [ $? -ne 0 ]; then
        echo "Failed to create directory 'copilot_workshop'. Please check your permissions."
        exit 1
    fi

    # Change to the newly created directory
    cd copilot_workshop
fi

# Check if we successfully changed to the directory
if [ $? -ne 0 ]; then
    echo "Failed to change to directory 'copilot_workshop'. Please check if the directory exists."
    exit 1
fi

# Check if copilot_training directory already exists
if [ -d "copilot_training" ]; then
    echo "Error: Directory 'copilot_training' already exists. Please delete it or move to another directory before running this script."
    exit 1
fi

# Clone the copilot_training repository
git clone $giturl

# Check if the repository was cloned successfully
if [ $? -ne 0 ]; then
    echo "Failed to clone the repository. Please check the Git URL and your network connection."
    exit 1
fi

#Setting Up the Virtual Environment
echo "Setting Up the Virtual Environment..."
python3 -m venv .venv

# Check for errors
if [ $? -ne 0 ]; then
    echo "Error: Failed to create a virtual environment. Please make sure Python 3 is installed."
    exit 1
fi

# Activating the Virtual Environment
echo "Activating the Virtual Environment..."
. .venv/bin/activate

# Check for errors
if [ $? -ne 0 ]; then
    echo "Error: Failed to activate the virtual environment. Please make sure the venv module is installed."
    exit 1
fi

# Installing the Workshop Code and Flask
echo "Installing the Workshop Code and Flask..."

# Check if pip3 is available
if command -v pip3 &> /dev/null
then
    pip3 install --upgrade pip
    pip3 install -e copilot_training
else
    pip install --upgrade pip
    pip install -e copilot_training
fi

# Check for errors
if [ $? -ne 0 ]; then
    echo "Error: Failed to install the workshop code and Flask. Please check the contents of copilot_training."
    exit 1
fi

GREEN='\033[0;32m'
NO_COLOR='\033[0m'

echo "${GREEN}Setup completed successfully. The virtual environment is activated, and the repository is installed.${NO_COLOR}"
echo
echo  "${GREEN}Navigate to the 'copilot_workshop' directory using the command 'cd copilot_workshop'.${NO_COLOR}"
echo
echo "${GREEN}Activate the virtual environment by typing '. .venv/bin/activate' in the terminal.${NO_COLOR}"
echo
echo  "${GREEN}Once you're in the 'copilot_workshop' directory, set the PYTHONPATH environment variable to include the current directory. You can do this by typing 'export PYTHONPATH=\$PYTHONPATH:$(pwd)' in the terminal.${NO_COLOR}"
echo
echo  "${GREEN}You can now run 'course101' by typing 'course101' in the terminal.${NO_COLOR}"


