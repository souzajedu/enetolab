class rundeck {
  package { "java-1.8.0":
    ensure => present
  }
  package {"http://repo.rundeck.org/latest.rpm":
    ensure => present,
  }
  package {"rundeck":
    ensure => present,
    require => Package["http://repo.rundeck.org/latest.rpm"]
  }
  service {"rundeckd":
    ensure => running,
    require => Package["rundeck"]
  } 
}
