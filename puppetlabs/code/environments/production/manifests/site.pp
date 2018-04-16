node "default" {
  include config
  include base
}

#node "dev3" {
 # include httpd
#}

#node "dev4" {
#  include httpd
#}

#node "dev3", "dev4" {
#  include httpd
#}

node /dev(3|4)/ {
  include docker
}

node "ubuntu2" {
  include nginx
}
 

