# Remote bucket state as data source

# Apply separate project to create VPC and populate separate state:
# $ terraform -chdir=src/e02/project_network init
# $ terraform -chdir=src/e02/project_network apply

# Uncomment and apply resources below:

# variable "e02_remote_state_bucket" {
#   type = string
# }
#
# data "terraform_remote_state" "network" {
#   backend = "gcs"
#   config = {
#     bucket = var.e02_remote_state_bucket
#     prefix = "network"
#   }
# }
#
# output "e02_subnet_name" {
#   value = data.terraform_remote_state.network.outputs.subnet_name
# }
