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
    value   => 'none',
    tag     => 'splunk_forwarder'
  }

}
