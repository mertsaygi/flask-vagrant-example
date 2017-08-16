node 'vagrant-test' {

	exec { 'apt-get update':
  		path => '/usr/bin',
	}

	file { '/var/www/':
  		ensure => 'directory',
	}

	package {  git: 
   		ensure => "installed" 
	}

	exec { "git-clone-${name}":
  		command => "git clone https://github.com/deis/example-python-flask -b master /usr/local/example-python-flask",
  		path    => "/usr/bin",
	}
  
  include nginx,supervisor,python

}
