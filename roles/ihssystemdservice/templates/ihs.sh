#!/bin/sh
#
# Starts the IBM HTTP Server
# description: Runs IHS Server

# Source function library.

#======================================================================
#======================================================================
start() {
echo "$0: starting IBM HTTP Server"
/opt/IBM/HTTPServer/bin/apachectl -k start -f /opt/IBM/HTTPServer/conf/httpd.conf
echo "IHS Startup completed"
}
#==============================================================================
stop() {
echo "$0: stopping IBM HTTP Server"
/opt/IBM/HTTPServer/bin/apachectl -k stop -f /opt/IBM/HTTPServer/conf/httpd.conf
echo "IHS Shutdown completed"
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
