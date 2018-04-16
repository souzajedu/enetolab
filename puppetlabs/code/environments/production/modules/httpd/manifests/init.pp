class httpd {
  case $::osfamily {
    'redhat':{
       $packages = [ 'httpd', 'php' ]
       $httpd = "httpd"
    }
    'debian':{
       $packages = [ 'apache2', 'php7.0', 'libapache2-mod-php' ]
       $httpd = "apache2"
    }
 }
    package { $packages:
    ensure => present,
    }
   # before => File["/var/www/html/index.php"]

  ->
  file {"/var/www/html/index.php":
    source => "puppet:///modules/httpd/index.php",
    ensure => present,
    notify => Service[$httpd]
  }
  -> 

  service {$httpd:
    ensure => running,
  }
}
