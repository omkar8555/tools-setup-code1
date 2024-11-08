variable "tools" {
    default = {
        vault = {
            instance_type = "t3.small"
            volume_size =20
            port = 8200
            }
        }
    }
variable "zone_id" {
    default = "Z08947163LH0CXG3JRYK4"
    }

variable "domain_name"  {
    domain_name = "rdevopsb2.shop"
    }