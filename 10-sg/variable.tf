variable "environment" {
  default = "dev"
}

variable "project" {
  default = "roboshop"
}

variable "mongodb_port" {
  default = [22, 27017]
}

variable "redis_port" {
  default = [22, 6379]
}

variable "mysql_port" {
  default = [22, 3306]
}

variable "rabbitmq_port" {
  default = [22, 5672]
}

variable "catalogue_port" {
  default = [22, 8080]
}

variable "cart_port" {
  default = [22, 8080]
}

variable "user_port" {
  default = [22, 8080]
}

variable "shipping_port" {
  default = [22, 8080]
}

variable "payment_port" {
  default = [22, 8080]
}

variable "frontend_port" {
  default = [22, 80]
}