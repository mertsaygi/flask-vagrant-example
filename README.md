Using Vagrant with Puppet for running a Flask application with gunicorn basicly.

Will Install Packages on server:
- Nginx
- Supervisor
- Gunicorn
- python-pip
- python-dev
- libpq-dev  

Installation:

Prerequisites:
1. Virtualbox

For install vagrant, please use this url and download reliable version for your operating system:

https://www.vagrantup.com/downloads.html

After download, install vagrant.

Using:

1. Clone https://github.com/mertsaygi/flask-example project in same directory with Vagrantfile or clone your project (In that case you may be need edit puppet modules on .puppet directory)
2. use vagrant up

In case of bad gateway:
May be you see bad gateway error on Nginx when some error occurs on Flask app. In that case you can see errors via manage.sh's show_error_logs or restart supervisor restart_supervisor. 

In case of any problem try vagrant reload or provision again vagrant provision before contact your administrator. 

