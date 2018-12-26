#!/bin/bash
version=201711141050
WAS_INSTALL_ROOT=/opt/IBM/WebSphere/AppServer

profiles=$(grep "<profile " ${WAS_INSTALL_ROOT}/properties/profileRegistry.xml | sed -r 's/[[:alnum:]]+=/\n&/g' | awk -F'path=' '{print $2}' | awk -F\" '{ print $2 }')

if [ "$1" == "Sync" ]; then
  echo "Start Servers syncronous."
  options=
else
  options="-nowait"
fi

for i in $profiles; do
  echo "Profile: $i"
  pushd $i/servers > /dev/null 2>&1
  for D in *; do 
    if [ ! "$D" == "nodeagent" -a ! "$D" == "dmgr" ]; then
      startServer=1
      if [ -f "$i/logs/${D}/${D}.pid" ]; then
        PID=$(cat $i/logs/${D}/${D}.pid)
        if [ "$PID" ]; then
          erg=$(ps -p $PID)
          if [ $? -eq 0 ]; then
            echo "Process with PID is running. Do not start."
            startServer=0
          fi
        fi
      fi
      if [ $startServer -eq 1 ]; then
        if [ -f "$i/bin/startServer.sh" ]; then
          echo "Start Server $i - $D"
          $i/bin/startServer.sh $D $options
        fi
      fi
    fi
  done
  popd > /dev/null 2>&1
done

