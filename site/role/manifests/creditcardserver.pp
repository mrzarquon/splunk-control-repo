class role::creditcardserver {

  include profile::base
  include profile::apache
  include profile::splunk::forwarder
  include profile::splunk::apache

}
