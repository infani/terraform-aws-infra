provider "aws" {
  region = var.region
}

//https://registry.terraform.io/modules/infani/infra/aws/latest/submodules/codepipeline
# module "infra_codepipeline_main" {
#   source           = "infani/infra/aws//modules/codepipeline"
#   version          = "1.0.2"
#   name             = "test-main"
#   connectionArn    = "connectionArn"
#   fullRepositoryId = "fullRepositoryId"
#   branch           = "main"
# }