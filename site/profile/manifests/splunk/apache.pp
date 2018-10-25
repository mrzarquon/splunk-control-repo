# Sample class to configure inputs for the 

class profile::splunk::apache (
  $access_log = '/var/log/httpd/access_log',
  $error_log = '/var/log/httpd/error_log',
) {

  @splunkforwarder_input { 'apache-access_log-sourcetype':
    section => "monitor:///${access_log}",
    setting => 'sourcetype',
    value   => 'apache-access_log',
    tag     => 'splunk_forwarder'
  }

  @splunkforwarder_input { 'apache-error_log-sourcetype':
    section => "monitor:///${error_log}",
    setting => 'sourcetype',
    value   => 'apache-error_log',
    tag     => 'splunk_forwarder'
  }
}
