#!/bin/bash

PYTHON3="python3"
PYTHON2="python2"
PERF="perf"

# Non existant ones used for testing control flow.
# Uncomment to test.
# PYTHON3="python3-aalksdjfsdj"
# PYTHON2="python2-aisudhfiansdf"
PERF="cat"

echo "Checking if python3 exists..."
PY_FOUND=0
which $PYTHON3 >/dev/null 2>&1
if [ $? == 0 ];then
    echo "Found python3"
    PY3_FOUND=1
    PY_FOUND=1
else
    echo "python3 not found."
    PY3_FOUND=0
fi

if [ $PY3_FOUND == 0 ];then
     echo "Checking if python2 exists..."
     which $PYTHON2 >/dev/null 2>&1
     if [ $? == 0 ];then
	 echo "python2 found"
	 PY2_FOUND=1
	 PY_FOUND=1
     else
	 echo "python2 also not found."
	 PY2_FOUND=0
     fi
fi

echo $PY_FOUND
if [ $PY_FOUND == 1 ]; then
    echo "Checking for required python packages..."
    if [ $PY3_FOUND == 1 ]; then
	python3 check_for_modules.py
    elif [ $PY2_FOUND == 1 ]; then
	python2 check_for_modules.py
    fi
else
    echo "Python not found. Cannot continue. Fatal abort."
    exit
fi


echo "Searching for perf..."
which $PERF >/dev/null 2>&1 
if [ $? == 1 ];then
    echo "perf not found!!
You need to install it to use the perf related performance analysis part.

Note that you will need sudo access to use the perf command.
----------------------------
Possible ways of installing:
Debian based (Ubuntu, Debian, etc.):
sudo apt-get update && sudo apt-get install linux-tools-common linux-tools-generic linux-tools-`uname -r`

Arch Linux:
sudo pacman -Sy --needed perf

(We haven't tested) RPM based (Fedora, RHEL (Red Hat), CentOS):
sudo dnf update && sudo dnf install perf

(We haven't tested) Fedora 23+:
sudo yum update && sudo yum install perf

(We haven't tested) Install from source:
If none of the above work, you can still install from source. 
You'll need to get the sources for your particular kernel version.
Navigate to the ./kernel-with-verions-number-here/tools/perf
Then use the make command.
You will then be able to execute it as ./perf. 
You can create a symlink in your /usr/bin/ or ~/bin/ so as to allow your shell to find this perf.
Best of luck.
"
    PERF_FOUND=0
else
    echo "Found perf."
    PERF_FOUND=1
    # echo "Checking version..."
    # perf --version
fi

if [ $PERF_FOUND == 1 ];then
    echo "Checking if you have sudo privileges"
    sudo -l >/dev/null 2>&1
    if [ $? == 1 ];then
	echo "You don't have sudo privileges. perf is of no use to you."
    else
	echo "You have some sudo privileges.
Please check that you can run the following commands with sudo:
--> perf
--> sysctl"
	sudo -l
    fi
fi
	
