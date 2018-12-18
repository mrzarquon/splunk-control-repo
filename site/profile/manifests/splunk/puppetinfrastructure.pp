# Sample class to configure inputs for the 

# /var/log/puppetlabs/puppetserver/puppetserver-access.log
# /var/log/puppetlabs/puppetdb/puppetdb.log
# /var/log/puppetlabs/puppetdb/puppetdb-access.log

class profile::splunk::puppetinfrastructure {

  @splunkforwarder_input { 'puppetserver-access_log-sourcetype':
    section => "monitor:///var/log/puppetlabs/puppetserver/puppetserver-access.log",
    setting => 'sourcetype',
    value   => 'puppetserver-access_log',
    tag     => 'splunk_forwarder',
  }

  @splunkforwarder_input { 'puppetdb_log-sourcetype':
    section => "monitor:///var/log/puppetlabs/puppetdb/puppetdb.log",
    setting => 'sourcetype',
    value   => 'puppetdb_log',
    tag     => 'splunk_forwarder',
  }

  @splunkforwarder_input { 'puppetdb-access_log-sourcetype':
    section => "monitor:///var/log/puppetlabs/puppetdb/puppetdb-access.log",
    setting => 'sourcetype',
    value   => 'puppetdb-access_log',
    tag     => 'splunk_forwarder',
  }
}
