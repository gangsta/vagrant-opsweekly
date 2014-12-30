Firewall {
  tag    => 'firewall',
  notify => Exec['iptables-save'],
}

Firewallchain {
  tag    => 'firewallchain',
  notify => Exec['iptables-save'],
}

resources{'firewall':
  purge => hiera('purge_firewall_rules'),
}
