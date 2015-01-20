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
    require  =>Class['apache'],
  }

  class {'opsweekly':
  }

  class { 'apache':
    default_vhost => false,
    default_mods  => false,
    mpm_module    => 'prefork',
  }

  class {'::apache::mod::php':
    package_name => 'php54-php',
    path         => "${::apache::params::lib_path}/libphp54-php5.so",
  }

  apache::vhost { '192.168.22.10':
    port        => '80',
    docroot     => '/var/www/html',
    aliases     => [
      {
        alias => '/opsweekly',
        path  => '/opt/opsweekly',
      },
    ],
    directories => [
      {
        path           => '/opt/opsweekly',
        options        => [ 'None' ],
        allow          => 'from All',
        allow_override => [ 'None' ],         #'None'
        order          => 'Allow,Deny',       #'Allow,Deny'
      }
    ]
  }

  file { 'info.php':
    ensure  => file,
    path    => '/var/www/html/info.php',
    require => Class['apache'],
    content => '<?php
phpinfo();
?>',
  }

  package {'centos-release-SCL':
    before =>Class['apache::mod::php'],
  }

  package {'php54-php-mysqlnd':
    ensure  => present,
    require => Package['centos-release-SCL'],
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

  #class {
  #'apache::mod::prefork':
    #startservers    => "5",
    #minspareservers => "3",
    #maxspareservers => "3",
    #serverlimit     => "64",
    #maxclients      => "64",
  #}

}
