
resource "fortios_firewall_policy" "permit-workstations-to-admin" {
  action             = "accept"
  logtraffic         = "all"
  name               = "permit-workstations-to-admin"
  schedule           = "always"
  nat                = "disable"
  utm_status         = "enable" 
  inspection_mode    = "flow" 
  av_profile         = "av-flow"
  ips_sensor         = "ips-primary"  
  webfilter_profile  = "webfilter-primary"
  application_list   = "app-control-primary"
  ssl_ssh_profile    = "certificate-inspection-primary"  

  dstaddr {
    name = "administration"
  }

  dstintf {
    name = "administration"
  }

  service {
    name = "SSH"
  }

  srcaddr {
    name = "workstations"
  }

  srcintf {
    name = "workstations"
  }
}

resource "fortios_firewall_policy" "permit-wlan-wkstn-to-admin" {
  action             = "accept"
  logtraffic         = "all"
  name               = "permit-wlan-wkstn-to-admin"
  schedule           = "always"
  nat                = "disable"
  utm_status         = "enable" 
  inspection_mode    = "flow" 
  av_profile         = "av-flow"
  ips_sensor         = "ips-primary"  
  ssl_ssh_profile    = "certificate-inspection-primary"  

  dstaddr {
    name = "res-phy-prd-rpi-1"
  }

  dstintf {
    name = "servers"
  }

  service {
    name = "SSH"
  }

  srcaddr {
    name = "wireless-workstations"
  }

  srcintf {
    name = "wireless"
  }
}