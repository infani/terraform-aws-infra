variable "name" {
  description = "Unique name"
}

variable "connectionArn" {
  description = "ConnectionArn"
}

variable "gitLocation" {
  type        = string
  description = "gitLocation, like https://github.com/VIVOTEK-IT/vivoreco.git"
}

variable "branch" {
}
