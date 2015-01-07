node 'opsweekly'{

  firewall {'000 explicit rule Opsweekly':
    proto  => 'tcp',
    dport  => '8080',
    action => 'accept',
  }

  yumrepo  {'opsweekly':
    baseurl  => 'https://pulp.inuits.eu/upstream/',
    gpgcheck => '0',
    enabled  => '1',
  }


  class {'opsweekly':
  }
  
  package {'php':
    ensure  => present,
  }

  package {'httpd':
    ensure  => present,
  }
  package { 'centos-release-SCL':
    ensure  => present,
  }

  class { 'mysql::server':
    require => Class['opsweekly'],
  }

  mysql::db { 'opsweekly':
    user     => 'opsweekly',
    password => 'opsweekly',
    host     => 'localhost',
    grant    => ['ALL'],
    sql      => '/opt/opsweekly/opsweekly.sql',
      import_timeout => 300,
  }

  #class { 'apache':
    #default_vhost => false,
  #}

  #apache::vhost { 'aliases':
    #aliases => [
      #{ alias =>'/opsweekly',
       # path  =>'/opt/opsweekly'
     # }
    #]
 # }

  class  { 'php::install':
  
  }
  
  #class { 'scl': }


}