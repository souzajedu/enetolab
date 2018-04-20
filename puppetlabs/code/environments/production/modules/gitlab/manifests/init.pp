class gitlab {
  $packages = ["curl", "openssh-server", "ca-certificates", "postfix"]
  
  service { "nginx":
    ensure => stopped
  }->
  package { "ngnix":
    ensure => absent
  }->
  package { $packages:
    ensure => present
  }
  ->
  exec {"Download Script":
    command => "/usr/bin/wget https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh -O /tmp/script.sh"
  }
  ->
  exec {"Execute Script":
    command => "/bin/bash /tmp/script.sh"
  }
  ->
  package {"gitlab-ce":
    ensure => present
  }
}
