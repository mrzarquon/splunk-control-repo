class profile::sshd (
  Enum['present','absent'] $ensure = present,
) {
  
  sshd_config { 'PermitRootLogin':
    ensure => $ensure,
    value  => 'no',
  }

}
