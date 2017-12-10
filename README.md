# Made by @v3ded in collab with @nibsec
# For educational purposes only

***

# Disclaimer
This script has been made for educational purposes ONLY and illegal use is condemned by the authors. We do not carry any responsibility for  damage caused by running this script - you, the user, are self responsible for damage caused.

# Description
A simple Cron backdoor for both *Linux* and *OSX* systems. It creates a hidden user-supplied directory inside victim's home root. A check is made if the current system has netcat installed and chooses a payload appropriately. Afterwards, a cronjob gets created which calls the script every minute by default. Simply use **nc -lvp PORT** to catch your shell. 
