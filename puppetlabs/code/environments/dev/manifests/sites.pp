node "default"{
  
  package{"sl":
    ensure => absent,
  }

  package{"htop":
    ensure => absent,
  }

  package{"nmap":
    ensure => absent,
  }
}
