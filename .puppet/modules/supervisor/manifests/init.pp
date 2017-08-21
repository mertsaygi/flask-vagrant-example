class supervisor{
	package {  supervisor: 
   		ensure => "installed" 
	}

  	service { 'supervisor':
    	ensure => running,
    	require => Package['supervisor'],
  	}

	file{"/var/log/flask-example":
    	ensure  =>  directory,
    	mode    =>  0755,
	}

	file{"/var/log/flask-example/flask-example.err.log":
    	ensure  =>  file,
    	mode    =>  0755,
    	require => File["/var/log/flask-example"],
	}

	file{"/var/log/flask-example/flask-example.out.log":
    	ensure  =>  file,
    	mode    =>  0755,
    	require => File["/var/log/flask-example"],
	}

	file{"/etc/supervisor/conf.d/flask-test.conf":
    	ensure  =>  file,
    	mode    =>  0755,
        require => Package['supervisor'],
        source => 'puppet:///modules/supervisor/flask-test.conf',
        notify => Service['supervisor'],
	}

}