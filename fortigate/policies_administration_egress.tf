resource "fortios_firewall_policy" "permit-administration-to-wan" {
  action             = "accept"
  logtraffic         = "all"
  name               = "permit-administration-to-wan"
  schedule           = "always"
  nat                = "enable"
  utm_status         = "enable" 
  inspection_mode    = "flow" 
  av_profile         = "av-flow"
  ips_sensor         = "ips-primary"  
  webfilter_profile  = "webfilter-primary"
  application_list   = "app-control-primary"
  ssl_ssh_profile    = "certificate-inspection-primary"  

  dstaddr {
    name = "PermittedCountries"
  }

  dstintf {
    name = "virtual-wan-link"
  }

  service {
    name = "DNS"
  }

  service {
    name = "HTTP"
  }

  service {
    name = "HTTPS"
  }

  srcaddr {
    name = "administration"
  }

  srcintf {
    name = "administration"
  }
}