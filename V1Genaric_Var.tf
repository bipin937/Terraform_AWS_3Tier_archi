variable "aws_region" {

    type = string
    default = "us-east-1"
  
}

variable "environment" {

    type = string
    default = "dev"
  
}

variable "business_divsion" {
  description = "Business Division in the large organization this Infrastructure belongs"
  type = string
  default = "sap"
}