#
#
#
class profiles::apache {

  include ::apache

  $apache_mod_php_path = hiera('apache_mod_php_path')

  class  {'::apache::mod::php':
    path => "${::apache::params::lib_path}/${apache_mod_php_path}",
  }

  $apache_vhost = hiera('apache_vhost')

  apache::vhost { "${apache_vhost}":
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
        allow_override => [ 'None' ],
        order          => 'Allow,Deny',
      },
    ],
  }

  package {'centos-release-SCL':
    before =>Class['apache::mod::php'],
  }

  package {'php54-php-mysqlnd':
    ensure  => present,
    require => Package['centos-release-SCL'],
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
