# configures intermediate forwarder on a universal forwarder

class profile::splunk::intermediate {

  @splunkforwarder_input { 'intermediate_compressed':
    section => 'splunktcp:9997',
    setting => 'compressed',
    value   => 'true',
    tag     => 'splunk_forwarder'
  }
  
  @splunkforwarder_input { 'intermediate_disabled':
    section => 'splunktcp:9997',
    setting => 'disabled',
    value   => '0',
    tag     => 'splunk_forwarder'
  }

  @splunkforwarder_input { 'intermediate_connection_host':
    section => 'splunktcp:9997',
    setting => 'connection_host',
    value   => 'splunk.c.splunk-217321.internal',
    tag     => 'splunk_forwarder'
  }

  @splunkforwarder_input { 'splunk_logs-sourcetype':
    section => "monitor:///opt/splunkforwarder/var/log/splunk/splunkd.log",
    setting => 'sourcetype',
    value   => 'splunk_logs',
    tag     => 'splunk_forwarder'
  }

  @splunkforwarder_input { 'splunk_errors-sourcetype':
    section => "monitor:///opt/splunkforwarder/var/log/splunk/splunkd_stderr.log",
    setting => 'sourcetype',
    value   => 'splunk_errors',
    tag     => 'splunk_forwarder'
  }


}
