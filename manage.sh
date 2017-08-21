#!/bin/bash

show_error_logs(){
	vagrant ssh -- -t 'cat /var/log/flask-example/flask-example.err.log'
}

restart_supervisor(){
	vagrant ssh -- -t 'sudo service supervisor restart'
}

case "$1" in
  show_error_logs)
    show_error_logs
    ;;
  restart_supervisor)
    restart_supervisor
    ;;
  *)
    echo "Usage: $0 {show_error_logs|restart_supervisor}"
    exit 1
esac

exit 0
