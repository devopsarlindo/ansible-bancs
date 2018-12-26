#!/bin/sh
#
# Starts the IBM HTTP Admin Server
# description: Runs IHS Admin Server

# Source function library.

#======================================================================
#======================================================================
start() {
echo "$0: starting IBM HTTP Admin Server"
/opt/IBM/HTTPServer/bin/adminctl -k start -f /opt/IBM/HTTPServer/conf/admin.conf
echo "IHS Admin Startup completed"
}
#==============================================================================
stop() {
echo "$0: stopping IBM HTTP Admin Server"
/opt/IBM/HTTPServer/bin/adminctl -k stop -f /opt/IBM/HTTPServer/conf/admin.conf
echo "IHS Admin Shutdown completed"
}

case $1 in
'start')
start
;;
'stop')
stop
;;
'restart')
stop
start
;;
*)
echo "usage: $0 {start|stop|restart}"
;;
esac
