resource "aws_imagebuilder_image_recipe" "example" {
  name         = "windows"
  parent_image = "arn:${data.aws_partition.current.partition}:imagebuilder:${data.aws_region.current.name}:aws:image/windows-server-2019-english-full-base-x86/x.x.x"
  version      = "1.0.0"
  user_data_base64 = "${base64encode(local.instance-userdata)}"

  block_device_mapping {
    device_name = "/dev/sda1"

    ebs {
      delete_on_termination = true
      volume_size           = 30
      volume_type           = "gp2"
    }
  }
  component {
    component_arn = "arn:aws:imagebuilder:us-east-1:aws:component/update-windows/1.0.1/1"
  }
}