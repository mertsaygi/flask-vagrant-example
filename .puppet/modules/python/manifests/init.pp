class python {
  $packages = ['python-pip', 'python-dev', 'libpq-dev']  

  package { $packages: 
   	ensure => "installed" 
  } 

  exec { "pip-install":
  	command => "pip install -r /vagrant/flask-example/requirements.txt",
  	path    => "/usr/bin",
    require => Package['python-pip', 'python-dev'],
  }
}