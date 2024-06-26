
resource "fortios_firewall_policy" "permit-prometheus-to-wkstns" {
  action             = "accept"
  logtraffic         = "all"
  name               = "permit-prometheus-to-wkstns"
  schedule           = "always"
  nat                = "enable"
  utm_status         = "enable" 
  inspection_mode    = "flow" 
  av_profile         = "av-flow"
  ips_sensor         = "ips-primary"  
  ssl_ssh_profile    = "certificate-inspection-primary"  

  dstaddr {
    name = "workstations"
  }

  dstintf {
    name = "workstations"
  }

  service {
    name = "prometheus-windows-exporter"
  }

  srcaddr {
    name = "servers"
  }

  srcintf {
    name = "servers"
  }
}

resource "fortios_firewall_policy" "permit-admin-to-wkstns" {
  action             = "accept"
  logtraffic         = "all"
  name               = "permit-admin-to-wkstns"
  schedule           = "always"
  nat                = "disable"
  utm_status         = "enable" 
  inspection_mode    = "flow" 
  av_profile         = "av-flow"
  ips_sensor         = "ips-primary"  
  ssl_ssh_profile    = "certificate-inspection-primary"  

  dstaddr {
    name = "workstations"
  }

  dstintf {
    name = "workstations"
  }

  service {
    name = "RDP"
  }

    service {
    name = "SSH"
  }

  srcaddr {
    name = "administration"
  }

  srcintf {
    name = "administration"
  }
}
