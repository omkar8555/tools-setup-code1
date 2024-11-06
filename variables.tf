variable "tools" = {
         default = {
             vault = {
                 port          = 8200
                 volume_size   = 28
                 instance_type = "t3.small"
                 }
             }
         }

variable "zone_id" {
    default = "Z08947163LH0CXG3JRYK4"
        }

variable "domain_name" {
    default = "rdevopsb72.shop"
    }