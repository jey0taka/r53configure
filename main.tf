# Provider
provider "aws" {
  region     = "${var.region}"
}
# General
data "aws_caller_identity" "current" {}

variable "resource-name" {
    default = "SampleOS"
}

variable "codecommit_url" {
    default = "hogehoge"
}

variable "codecommit_reponame" {
    default = "hogehoge"
}

# AWS
variable "region" {
  default = "ap-northeast-1"
}