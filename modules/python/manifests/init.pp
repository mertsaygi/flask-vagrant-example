class python {
  $packages = ['python-pip', 'python-dev', 'libpq-dev']  

  package { $packages: 
   	ensure => "installed" 
  } 

  exec { "pip-install":
  	command => "pip install -r /usr/local/example-python-flask/requirements.txt",
  	path    => "/usr/bin",
    require => Package['python-pip'],
  }
}