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

# module "infra_ec2" {
#   source = "./modules/ec2"
#   instance_type = "t3.large"
#   key_name= "dev20230522"
# }

module "infra_codebuild_dev" {
  source      = "./modules/codebuild"
  name        = "test-dev"
  gitLocation = "https://github.com/VIVOTEK-IT/vivoreco.git"
  branch      = "main"
  headRef     = "refs/heads/main"
}
