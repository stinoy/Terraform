#resource "aws_directory_service_directory" "ad" {
#  name        = var.directory_dns_name
#  short_name  = var.directory_netbios_name
#  password    = var.admin_password
#  edition     = "Enterprise"
#  type        = "MicrosoftAD"
#
#  vpc_settings {
#    vpc_id     = var.vpc_id
#    subnet_ids = [var.subnet_1, var.subnet_2]
#  }
#}
#
#output "directory_id" {
#  value = aws_directory_service_directory.ad.id#
resource "aws_directory_service_directory" "ad" {
  name        = var.directory_dns_name
  short_name  = var.directory_netbios_name
  password    = var.admin_password
  edition     = "Enterprise"
  type        = "MicrosoftAD"

  vpc_settings {
    vpc_id     = var.vpc_id
    subnet_ids = [var.subnet_1, var.subnet_2]
  }
}

resource "null_resource" "enable_user_group_management" {
  depends_on = [aws_directory_service_directory.ad]

  provisioner "local-exec" {
    command = <<EOT
      aws ds enable-radius --directory-id ${aws_directory_service_directory.ad.id} \
      --radius-settings '{
        "RadiusServers": ["192.168.1.1"],
        "RadiusPort": 1812,
        "RadiusRetries": 3,
        "RadiusTimeout": 10,
        "SharedSecret": "MyStrongSecret",
        "AuthenticationProtocol": "PAP",
        "DisplayLabel": "MyRadiusServer",
        "UseSameUsername": true
      }' --region ${var.aws_region}
    EOT
  }
}

output "directory_id" {
  value = aws_directory_service_directory.ad.id
}

