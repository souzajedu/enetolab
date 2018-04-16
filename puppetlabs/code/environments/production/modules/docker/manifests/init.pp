class docker {
  $old_docker = [ 'docker', 'docker-client', 'docker-client-latest', 'docker-common', 'docker-latest', 'docker-latest-logrotate', 'docker-logrotate', 'docker-selinux', 'docker-engine-selinux', 'docker-engine' ]
  $pre_reqs = ['yum-utils', 'device-mapper-persistent-data', 'lvm2' ]

  package {$old_docker:
    ensure => absent
  }
->
  package {$pre_reqs:
    ensure => present
  }
->
  exec {"add_repo":
    command => "/usr/bin/yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo" 
  }
->
  exec {"enable_repo":
    command => "/usr/bin/yum-config-manager --enable docker-ce-edge" 
  }
->
  package {"docker-ce":
    ensure => present
  }
->
  service {"docker":
    ensure => running,
    enable => true
	  }
}
