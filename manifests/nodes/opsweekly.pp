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

  class {'opsweekly':}
}