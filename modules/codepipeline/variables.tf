variable "name" {
  description = "Unique name"
}

variable "connectionArn" {
  description = "ConnectionArn"
}

variable "fullRepositoryId" {
  type        = string
  description = "fullRepositoryId, like VIVOTEK-IT/vortex-cleaner"
}

variable "branch" {
}
