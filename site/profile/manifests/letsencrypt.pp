class profile::letsencrypt {

  letsencrypt::certonly { 'puppet.angrydome.org':
    domains              => ['puppet.angrydome.org'],
    plugin               => 'webroot',
    webroot_paths        => ['/var/www/html'],
    manage_cron          => true,
    cron_hour            => [0,12],
    cron_minute          => '30',
    cron_success_command => '/bin/systemctl reload pe-nginx',
    suppress_cron_output => true,
  }
}
