# this is an example class to generate a failed puppet run on a box

class profile::winfail {

  service { 'badwindowsservicename':
    ensure => running,
    enable => true,
  }
}
