class role::creditcardserver {

  #This role would be made of all the profiles that need to be included to make a webserver work
  #All roles should include the base profile
  include profile::base
  include profile::apache
  include profile::splunk::forwarder
  include profile::splunk::apache

}
