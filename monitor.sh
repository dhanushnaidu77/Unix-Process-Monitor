#!/bin/bash


PROCESS_NAME="apache2"
EMAIL="dhanush@gmail.com"
LOG_FILE="/var/log/process_monitor.log"


if ! pgrep "$PROCESS_NAME" > /dev/null
then
   
    echo "$(date): $PROCESS_NAME is not running, restarting..." >> $LOG_FILE
    
   
    echo "Subject: Alert! $PROCESS_NAME has stopped" | sendmail $EMAIL
    
   
    sudo systemctl start apache2
fi
