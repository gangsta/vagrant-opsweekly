# Class: php::install
#
#
class php::install {

  package {'php54-php-bcmath':
    ensure  => present,
    require => Package['centos-release-SCL'],
  }

  package {'php54':
    ensure  => present,
    require => Package['centos-release-SCL'],
  }

  package {'php54-php-cli':
    ensure  => present,
    require => Package['centos-release-SCL'],
  }

  package {'php54-php-gd':
    ensure  => present,
    require => Package['centos-release-SCL'],
  }

  package {'php54-php-ldap':
    ensure  => present,
    require => Package['centos-release-SCL'],
  }

  package {'php54-php-mbstring':
    ensure  => present,
    require => Package['centos-release-SCL'],
  }

  package {'php54-php-xmlrpc':
    ensure  => present,
    require => Package['centos-release-SCL'],
  }

  package {'php54-php':
    ensure  => present,
    require => Package['centos-release-SCL'],
  }

  package {'php54-php-pdo':
    ensure  => present,
    require => Package['centos-release-SCL'],
  }

  package {'php54-php-pear':
    ensure  => present,
    require => Package['centos-release-SCL'],
  }

  package {'php54-php-pecl-apc':
    ensure  => present,
    require => Package['centos-release-SCL'],
  }

  package {'php54-php-mysqlnd':
    ensure  => present,
    require => Package['centos-release-SCL'],
  }

  package {'php54-php-process':
    ensure  => present,
    require => Package['centos-release-SCL'],
  }
}
