class nginx {
  package {"apache2":
    ensure => absent,
    require => Service["apache2"]
  }

  service {"apache2":
    ensure => stopped
  }

  package {"nginx":
    ensure => present,
    require => Package["apache2"]
  }
  ->
  service {"nginx":
    ensure => running,
  }
}
