node 'vagrant-test' {

	exec { 'apt-get update':
  		path => '/usr/bin',
	}

	file { '/var/www/':
  		ensure => 'directory',
	}
  
    include nginx,supervisor,python

}
