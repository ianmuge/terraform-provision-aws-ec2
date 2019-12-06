provider "aws" {
  region = var.aws_region
  //  shared_credentials_file = "~/.aws/credentials"
  //  profile = "default"
  //  access_key = "${env.AWS_ACCESS_KEY_ID}"
  //  secret_key = "${env.AWS_SECRET_ACCESS_KEY}"
}

data "aws_ami" "rhel" {
  most_recent = true
  filter {
    name   = "name"
    values = ["RHEL-7*"]
  }
  owners = ["309956199498"] # Redhat
}
data "aws_vpc" "selected" {
  id = "${var.vpc_id}"
}

data "aws_subnet_ids" "selected" {
  vpc_id            = "${var.vpc_id}"
  filter {
    name = "availability-zone"
    values = ["${var.aws_region}${var.zone}"]
  }
}
data "aws_security_groups" "selected" {
  filter {
    name   = "vpc-id"
    values = ["${var.vpc_id}"]
  }
}
resource "aws_instance" "rhel" {
  count                       = var.instance_count
  ami                         = "${data.aws_ami.rhel.id}"
  instance_type               = var.instance_type
  ebs_optimized               = var.ebs_optimized
  key_name                    = var.key_name
  vpc_security_group_ids      = data.aws_security_groups.selected.ids
  subnet_id                   = tolist(data.aws_subnet_ids.selected.ids)[count.index]
  associate_public_ip_address = var.associate_public_ip_address
  monitoring                  = var.monitoring
  availability_zone           = "${var.aws_region}${var.zone}"
  disable_api_termination     = var.disable_api_termination

  tags = {
    env     = "${data.aws_vpc.selected.tags.Name}"
    role    = var.role
    service = var.service
    Name    = "${data.aws_vpc.selected.tags.Name}-${var.role}-${var.service}"
  }
  volume_tags = {
    env     = "${data.aws_vpc.selected.tags.Name}"
    role    = var.role
    service = var.service
    Name    = "${data.aws_vpc.selected.tags.Name}-${var.role}-${var.service}"
  }
  ebs_block_device {
    device_name = "/dev/sda1"
    volume_size = var.block_device.volume_size
    volume_type = "gp2"
    //    iops="(${var.block_device.volume_size}>35 and ${var.block_device.volume_size}<1000) ? (${var.block_device.volume_size}*3) : 100"
    delete_on_termination = true
  }
  lifecycle {
    create_before_destroy = true
  }


}