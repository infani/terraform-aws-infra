variable "name" {
  description = "Unique name"
}

variable "gitLocation" {
  type        = string
  description = "gitLocation, like https://github.com/VIVOTEK-IT/vivoreco.git"
}

variable "headRef" {
  description = "git head ref, like refs/heads/main, ^refs/tags/.*-release, ^refs/tags/.*-prod"
}