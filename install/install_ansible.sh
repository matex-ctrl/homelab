#! /bin/bash

# Run the script with source install_ansible.sh to automatically activate venv for current user.
VENV_DIR="$HOME/venv"

if [ -d "$VENV_DIR" ]; then
  deactivate 2>/dev/null
  rm -rf "$VENV_DIR"
  echo "Python virtual environment deactivated"
  echo "Directory $VENV_DIR deleted."
fi

sudo apt install git python3-pip python3-venv gcc python-dev-is-python3 libkrb5-dev

python3 -m venv "$VENV_DIR"

source "$VENV_DIR"/bin/activate

python3 -m pip install --upgrade pip

python3 -m pip install --upgrade wheel

python3 -m pip install --upgrade setuptools

python3 -m pip install --upgrade -r ./requirements

if grep -q activate ~/.bashrc ; then
    echo "Python venv already enabled on logon"
else
    echo "source ~/.venv/bin/activate" >> ~/.bashrc
    echo "Python venv enabled on logon"
fi
