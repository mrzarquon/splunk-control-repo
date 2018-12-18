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

  @splunkforwarder_input { 'pe-orchestration-services_log-sourcetype':
    section => "monitor:///var/log/puppetlabs/orchestration-services/orchestration-services.log",
    setting => 'sourcetype',
    value   => 'pe-orchestration-services_log',
    tag     => 'splunk_forwarder',
  }

  @splunkforwarder_input { 'pe-console-services-access_log-sourcetype':
    section => "monitor:///var/log/puppetlabs/console-services/console-services-access.log",
    setting => 'sourcetype',
    value   => 'pe-console-services-access_log',
    tag     => 'splunk_forwarder',
  }

  @splunkforwarder_input { 'pe-console-services-api-access_log-sourcetype':
    section => "monitor:///var/log/puppetlabs/console-services/console-services-api-access.log",
    setting => 'sourcetype',
    value   => 'pe-console-services-api-access_log',
    tag     => 'splunk_forwarder',
  }

}
