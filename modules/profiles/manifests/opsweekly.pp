#
#
#
class profiles::opsweekly {

  firewall {'000 explicit rule Opsweekly':
    proto  => 'tcp',
    dport  => hiera('firewall_port'),
    action => 'accept',
  }

  include opsweekly::opsweekly

}