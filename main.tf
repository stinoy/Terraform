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

  triggers = {
    always_run = timestamp()  # Forces execution every time
  }

  provisioner "local-exec" {
    command = "aws ds enable-directory-data-access --directory-id ${aws_directory_service_directory.ad.id} --region ${var.aws_region}"
  }
}
output "directory_id" {
  value = aws_directory_service_directory.ad.id
}
