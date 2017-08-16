class supervisor{
	package {  supervisor: 
   		ensure => "installed" 
	}

  	service { 'supervisor':
    	ensure => running,
    	require => Package['supervisor'],
  	}

	file{"/var/log/example-python-flask":
    	ensure  =>  directory,
    	mode    =>  0755,
	}

	file{"/var/log/example-python-flask/example-python-flask.err.log":
    	ensure  =>  file,
    	mode    =>  0755,
    	require => File["/var/log/example-python-flask"],
	}

	file{"/var/log/example-python-flask/example-python-flask.out.log":
    	ensure  =>  file,
    	mode    =>  0755,
    	require => File["/var/log/example-python-flask"],
	}

	file{"/etc/supervisor/conf.d/flask-test.conf":
    	ensure  =>  file,
    	mode    =>  0755,
        require => Package['supervisor'],
        source => 'puppet:///modules/supervisor/flask-test.conf',
        notify => Service['supervisor'],
	}

}