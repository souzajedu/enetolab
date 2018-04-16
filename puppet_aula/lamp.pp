service { 'nginx':
  ensure => 'stopped',
}

package { 'nginx':
  ensure => 'absent',
}

package { 'apache2':
  ensure => "present",
}

package { 'php7.0':
  ensure => "present",
}

package { 'libapache2-mod-php7.0':
  ensure => "present",
}

exec { 'a2enmod':
  command => "/usr/sbin/a2enmod php7.0"
}

file { "/var/www/html/index.php":
   content => "<?php echo 'index Puppet'; ?>",
}

service { "apache2":
  ensure => "running",
}

 
