
resource "fortios_firewall_policy" "permit-wan-to-webserver" {
  action             = "accept"
  logtraffic         = "all"
  name               = "permit-wan-to-webserver"
  schedule           = "always"
  nat                = "disable"
  utm_status         = "enable" 
  inspection_mode    = "flow" 
  av_profile         = "av-flow"
  ips_sensor         = "ips-primary"  
  ssl_ssh_profile    = "certificate-inspection-primary"  

  dstaddr {
    name = "webserver-vip-group"
  }

  dstintf {
    name = "webservers"
  }

  service {
    name = "HTTP"
  }

  service {
    name = "HTTPS"
  }

  srcaddr {
    name = "PermittedCountries"
  }

  srcintf {
    name = "virtual-wan-link"
  }
}