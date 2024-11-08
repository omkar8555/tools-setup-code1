resource "aws_security_group" "sg" {
  name        = "${var.tool_name}-sg"
  description = "inbound allow for ${var.tool_name} "

  ingress {
      from_port        = 22
      to_port          = 22
      protocol         = "TCL"
      cidr_blocks      = ["0.0.0.0/0"]

    }

  egress {
      from_port        = sg_port
      to_port          = sg_port
      protocol         = "TCL"
      cidr_blocks      = ["0.0.0.0/0"]

    }

  egress {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]

    }
tags =  {
    name = "{var.tool_name}-sg"
    }
  }

  resource "aws_instance" "instance" {
      ami = data.aws_ami.ami.id
      instance_type = var.instance_type
      vpc_security_group_id =["aws_security_group.sg.id"]
      tags = {
          Name = "${var.tool_name}"
          }
      root_block_device = {
          volume_size = var.volume_size
          }
      }

  resource "aws_route53_record" "record-private" {
        zone_id = var.zone_id
        name = ${var.tool_name}.${var.domain_name}
        type = "A"
        ttl ="30"
        records = [ aws_instance.instance.private_id]
        }
    resource "aws_route53_record" "record-internal" {
          zone_id = var.zone_id
          name = "${var.tool_name}.internal.${var.domain_name}"
          type = "A"
          ttl ="30"
          records = [ aws_instance.instance.public_id]
          }
