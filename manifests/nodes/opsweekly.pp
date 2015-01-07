#node Opsweekly
#
#firewall + mysql and some configuration`s
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

  package {'centos-release-SCL':
    ensure  => present,
  }

  class {'mysql::server':
    require => Class['opsweekly'],
  }

  mysql::db {'opsweekly':
    user           => 'opsweekly',
    password       => 'opsweekly',
    host           => 'localhost',
    grant          => ['ALL'],
    sql            => '/opt/opsweekly/opsweekly.sql',
    import_timeout => 300,
  }

  class  {'php::install':
  }

  #####################################
  ### You can use you own settings  ###
  ### for scl or apache `see below  ###
  #####################################


  #class { 'scl': }

  #class { 'apache':
    #default_vhost => false,
  #}

  #apache::vhost { 'aliases':
    #aliases => [
      #{ alias =>'/opsweekly',
        #path  =>'/opt/opsweekly'
      #}
    #]
  #}

}
