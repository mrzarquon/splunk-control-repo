# simple class to deploy the forwarder

class profile::splunk::forwarder (
  $version = 7.1.3,
  $build = 51d9cac7b837,
) {
  class { '::splunk::params':
    version  => $version,
    build    => $build,
    src_root => 'https://download.splunk.com',
  }

  class { '::splunk::forwarder':
    package_ensure => 'latest',
  }

}
