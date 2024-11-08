module "tools" {
    source = "./module-ec2"
    for_each = var.tools
    tool_name = each.key
    instance_type = each.value[instance_type]
    sg_port = each.value[port]
    volume_size = each.value[volume_size]
    domain_name = var.domain_name
    zone_id = var.zone_id
    }