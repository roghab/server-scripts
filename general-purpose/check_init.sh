#!/bin/bash
#checks if the system runs systemd or init. If systemd returns 1, if init return 2, on error returns -1
USER=$1;
IP=$2;

ssh -t $USER@$IP '
pidof systemd && echo "systemd" || echo "other" 2>&1
' >./out.txt;
echo $init;
if[init=="systemd"];then
  {
    exit 1;
  }
else if[init=="other"];then
  {
    exit 2;
  }
exit -1;
