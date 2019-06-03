# firewall profile included in web roles
class profile::firewall(
  Enum['present','absent'] $ensure = present,
) {

  case $os['family'] {

    'windows': {
      windows_firewall::exception { 'SSL':
        ensure       => $ensure,
        enabled      => true,
        local_port   => 443,
        direction    => 'in',
        action       => 'allow',
        protocol     => 'TCP',
        remote_port  => 'any',
        display_name => 'SSL 443 IN',
        description  => 'Allow 443 traffic in from anywhere',
      }

      # Default firewall rules
      class { '::windows_firewall':
        ensure => 'running',
      }

      windows_firewall::exception { 'Permit ICMPv4':
        ensure       => present,
        direction    => 'in',
        action       => 'allow',
        enabled      => true,
        protocol     => 'ICMPv4',
        display_name => 'Permit ICMPv4',
        description  => 'Permit ICMPv4',
      }

      windows_firewall::exception { 'WINRM':
        ensure       => present,
        direction    => 'in',
        action       => 'allow',
        enabled      => true,
        protocol     => 'TCP',
        local_port   => 5985,
        remote_port  => 'any',
        display_name => 'Windows Remote Management HTTP-In',
        description  => 'Inbound rule for Windows Remote Management via WS-Management. [TCP 5985]',
      }

      windows_firewall::exception { 'RDP':
        ensure       => present,
        direction    => 'in',
        action       => 'allow',
        enabled      => true,
        protocol     => 'TCP',
        local_port   => 3889,
        remote_port  => 'any',
        display_name => 'Windows RDP',
        description  => 'Inbound rule for Windows RDP. [TCP 3889]',
      }

    }
    
    'RedHat':   {
      firewall { '100 allow_https':
        ensure => $ensure,
        dport  => 443,
        proto  => tcp,
        action => accept,
      }

      # Default firewall rules
      firewall { '000 accept all icmp':
        proto  => 'icmp',
        action => 'accept',
      }

      firewall { '001 accept all to lo interface':
        proto   => 'all',
        iniface => 'lo',
        action  => 'accept',
      }

      firewall { '002 accept related established rules':
        proto  => 'all',
        state  => ['RELATED', 'ESTABLISHED'],
        action => 'accept',
      }

      firewall { '100 ssh access':
        dport  => 22,
        proto  => tcp,
        action => accept,
      }

      firewall { '999 drop all':
        proto  => 'all',
        action => 'drop',
        before => undef,
      }
      
      resources { 'firewall':
        purge => true,
      }
    }
    default: {
      fail("profile::firewall::combined does not support $os[family]")
    }
  }

}
