This reposatory was created to sync common bash aliases accross systems

SETUP:

SIMPLE SETUP:
Just add the following 3 lines to your .bashrc or .bash_profile

export BASH_COMMON_PATH=~/.bash_common #or wherever
if [ -f $BASH_COMMON_PATH/load ]; then
. $BASH_COMMON_PATH/load
fi


SHARED ROOT:
1) Make sure "PermitUserEnvironment yes" is enabled in the /etc/ssh/sshd_config 

3) Add the following text before your SSH key in the ~/.ssh/authorized_keys2 file

environment="LOGIN=username" ssh-rsa AAAAB

4) Add the following code to the ~/.bashrc or ~/.bash_profile file

if [ "$LOGIN" == "username" ]; then
  if [ -f $BASH_COMMON_PATH/load ]; then
    . $BASH_COMMON_PATH/load
  fi
fi

