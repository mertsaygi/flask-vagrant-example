class nginx {
  package { 'nginx':
    ensure => 'present',
    require => Exec['apt-get update'],
  }

  service { 'nginx':
    ensure => running,
    require => Package['nginx'],
  }

  file { 'vagrant-nginx':
    path => '/etc/nginx/sites-available/flask',
    ensure => file,
    require => Package['nginx'],
    source => 'puppet:///modules/nginx/flask',
  }

  file { 'default-nginx-disable':
    path => '/etc/nginx/sites-enabled/default',
    ensure => absent,
    require => Package['nginx'],
  }

  file { 'vagrant-nginx-enable':
    path => '/etc/nginx/sites-enabled/flask',
    target => '/etc/nginx/sites-available/flask',
    ensure => link,
    notify => Service['nginx'],
    require => [
      File['vagrant-nginx'],
      File['default-nginx-disable'],
    ],
  }

}