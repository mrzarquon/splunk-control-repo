class profile::splunk::letsencrypt {
  include apache

  class {'letsencrypt':
    email          => 'chrisb@angrydome.org',
    configure_epel => true,
  }

  letsencrypt::certonly { 'splunk.angrydome.org':
    domains              => ['splunk.angrydome.org'],
    plugin               => 'webroot',
    webroot_paths        => ['/var/www/html'],
    manage_cron          => true,
    cron_hour            => [0,12],
    cron_minute          => '30',
    cron_success_command => '/opt/splunk/bin/splunk restart splunkweb --auth admin:puppetlabs',
    suppress_cron_output => true,
    require              => Class['apache'],
  }
}
