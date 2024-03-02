terraform {
    required_providers {
        fortios = {
            source = "fortinetdev/fortios"
        }
    }
}

provider fortios {
    hostname = "192.168.1.99"
    token = var.TF_FORTIOS_TOKEN
    insecure = "true"
}

resource "fortios_firewall_address" "res-phy-prd-fwp" {
    name = "res-phy-prd-fwp"
}

