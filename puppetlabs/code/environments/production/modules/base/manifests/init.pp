class base {
  $packages = [ 'vim', 'sysstat', 'htop', 'telnet', 'iotop', 'nmon', 'netcat', 'nmap' ]
  package { $packages:
    ensure => present
  }
}
