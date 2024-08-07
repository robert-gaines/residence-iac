
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
    name = "HTTPS"
  }

  srcaddr {
    name = "PermittedCountries"
  }

  srcintf {
    name = "virtual-wan-link"
  }
}

resource "fortios_firewall_policy" "deny-threat-objects-to-webserver" {
  action               = "deny"
  logtraffic           = "all"
  name                 = "deny-threat-objects-to-webserver"
  schedule             = "always"
  nat                  = "disable"
  internet_service_src = "enable"  
  block_notification   = "enable"

  dstaddr {
    name = "webserver-vip-group"
  }

  dstintf {
    name = "webservers"
  }

  internet_service_src_name {
    name = "Botnet-C&C.Server"
  }

  internet_service_src_name {
    name = "BinaryEdge-Scanner"
  }

  internet_service_src_name {
    name = "Censys-Scanner"
  }

  internet_service_src_name {
    name = "CriminalIP-Scanner"
  }

  internet_service_src_name {
    name = "Cyber.Casa-Scanner"
  }

  internet_service_src_name {
    name = "Internet.Census.Group-Scanner"
  }

  internet_service_src_name {
    name = "InterneTTL-Scanner"
  }

  internet_service_src_name {
    name = "LeakIX-Scanner"
  }

  internet_service_src_name {
    name = "NetScout-Scanner"
  }

  internet_service_src_name {
    name = "Recyber-Scanner"
  }

  internet_service_src_name {
    name = "Shadowserver-Scanner"
  }

  internet_service_src_name {
    name = "Shodan-Scanner"
  }

  internet_service_src_name {
    name = "Stretchoid-Scanner"
  }

  internet_service_src_name {
    name = "Tenable-Tenable.io.Cloud.Scanner"
  }

  internet_service_src_name {
    name = "UK.NCSC-Scanner"
  }

  internet_service_src_name {
    name = "Tor-Exit.Node"
  }

  internet_service_src_name {
    name = "Tor-Relay.Node"
  }

  internet_service_src_name {
    name = "Malicious-Malicious.Server"
  }

  internet_service_src_name {
    name = "Proxy-Proxy.Server"
  }

  internet_service_src_name {
    name = "VPN-Anonymous.VPN"
  }

  srcintf {
    name = "virtual-wan-link"
  }

  service {
    name = "ALL"
  }
}

resource "fortios_firewall_policy" "deny-cloud-providers-to-webserver" {
  action               = "deny"
  logtraffic           = "all"
  name                 = "deny-cloud-providers-to-webserver"
  schedule             = "always"
  nat                  = "disable"
  internet_service_src = "enable"  
  block_notification   = "enable"

  dstaddr {
    name = "webserver-vip-group"
  }

  dstintf {
    name = "webservers"
  }

  internet_service_src_name {
    name = "DigitalOcean-DigitalOcean.Platform"
  }

  internet_service_src_name {
    name = "Google-Google.Cloud"
  }

  internet_service_src_name {
    name = "Amazon-AWS"
  }

  internet_service_src_name {
    name = "Tencent-Other"
  }

  internet_service_src_name {
    name = "Microsoft-Other"
  }

  internet_service_src_name {
    name = "Hosting-Bulletproof.Hosting"
  }

  internet_service_src_name {
    name = "Akamai-Linode.Cloud"
  }

  internet_service_src_name {
    name = "OVHcloud-OVHcloud"
  }

  internet_service_src_name {
    name = "Alibaba-Alibaba.Cloud"
  }

  srcintf {
    name = "virtual-wan-link"
  }

  service {
    name = "ALL"
  }
}

resource "fortios_firewall_policy" "deny-threat-feeds-to-webserver" {
  action               = "deny"
  logtraffic           = "all"
  name                 = "deny-threat-feeds-to-webserver"
  schedule             = "always"
  nat                  = "disable" 
  block_notification   = "enable"

  dstaddr {
    name = "webserver-vip-group"
  }

  dstintf {
    name = "webservers"
  }

  srcaddr {
    name = "proofpoint-emerging-threats"
  }  

  srcaddr {
    name = "feodo-botnet-c2"
  }

  srcaddr {
    name = "honeypot-intruders"
  }  

  srcaddr {
    name = "checkpoint-tor-nodes"
  }    

  srcaddr {
    name = "firehol-blocklist"
  }    

  srcaddr {
    name = "cymru-bogons"
  }   

  srcintf {
    name = "virtual-wan-link"
  }

  service {
    name = "ALL"
  }
}

resource "fortios_firewall_policy" "deny-misc-threats-to-webserver" {
  action               = "deny"
  logtraffic           = "all"
  name                 = "deny-misc-threats-to-webserver"
  schedule             = "always"
  nat                  = "disable" 
  block_notification   = "enable"

  dstaddr {
    name = "webserver-vip-group"
  }

  dstintf {
    name = "webservers"
  }

  srcaddr {
    name = "SupplementaryBlockList"
  }   

  srcintf {
    name = "virtual-wan-link"
  }

  service {
    name = "ALL"
  }
}

resource "fortios_firewall_policy" "deny-legit-scanners-to-hps" {
  action               = "deny"
  logtraffic           = "all"
  name                 = "deny-legit-scanners-to-hps"
  schedule             = "always"
  nat                  = "disable"
  internet_service_src = "enable"  
  block_notification   = "enable"

  dstaddr {
    name = "honeypot-vip-group"
  }

  dstintf {
    name = "deception"
  }

  internet_service_src_name {
    name = "Censys-Scanner"
  }

  internet_service_src_name {
    name = "Shodan-Scanner"
  }

  srcintf {
    name = "virtual-wan-link"
  }

  service {
    name = "ALL"
  }
}

resource "fortios_firewall_policy" "permit-wan-to-honeypots" {
  action             = "accept"
  logtraffic         = "all"
  name               = "permit-wan-to-honeypots"
  schedule           = "always"
  nat                = "disable"
  utm_status         = "enable" 
  inspection_mode    = "flow" 
  av_profile         = "av-flow"
  ips_sensor         = "ips-primary"  
  ssl_ssh_profile    = "certificate-inspection-primary" 

  dstaddr {
    name = "honeypot-vip-group"
  }

  dstintf {
    name = "deception"
  }

  service {
    name = "honeypot-services"
  }

  srcaddr {
    name = "all"
  }

  srcintf {
    name = "virtual-wan-link"
  }
}