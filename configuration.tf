resource "aws_imagebuilder_infrastructure_configuration" "example" {
  description                   = "example description"
  instance_profile_name         = "EC2InstanceProfileForImageBuilder"
  name                          = "windows"
  terminate_instance_on_failure = true
}