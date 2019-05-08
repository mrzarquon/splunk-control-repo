class profile::agent_settings {
  Pe_ini_setting {
    ensure  => present,
    path    => "${::puppet_enterprise::params::confdir}/puppet.conf",
    section => 'agent',
  }

  pe_ini_setting { 'enable splay':
    setting => 'splay',
    value   => true,
  }

  pe_ini_setting { 'set splaylimit':
    setting => 'splaylimit',
    value   => '5m',
  }

  pe_ini_setting { 'shorten runinterval':
    setting => 'runinterval',
    value   => '5m',
  }

}
