variable "project" {
  default = "roboshop"
}

variable "environment" {
  default = "dev"
}

variable "public_cidr" {
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_cidr" {
  default = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "databse_cidr" {
  default = ["10.0.5.0/24", "10.0.6.0/24"]
}