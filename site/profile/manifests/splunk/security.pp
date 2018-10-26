# security monitoring standards

class profile::splunk::security {

  @splunkforwarder_input { 'linux_audit_log-sourcetype':
    section => 'monitor:///var/log/audit/audit.log',
    setting => 'sourcetype',
    value   => 'linux_audit_log',
    tag     => ['splunk_forwarder', 'security'],
  }

  @splunkforwarder_input { 'linux_secure_log-sourcetype':
    section => 'monitor:///var/log/secure',
    setting => 'sourcetype',
    value   => 'linux_secure_log',
    tag     => ['splunk_forwarder', 'security'],
  }
  
}
