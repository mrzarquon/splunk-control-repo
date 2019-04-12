class profile::letsencrypt {

  letsencrypt::certonly { 'puppet.angrydome.org':
    domains       => ['puppet.angrydome.org'],
    plugin        => 'webroot',
    webroot_paths => ['/var/www/html'],
  }
}
