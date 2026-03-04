variable "aws_region" {
  description = "AWS region to deploy resources"
  default     = "us-west-2"
}

variable "app_name" {
  description = "Name of the application"
  default     = "python-cicd-pipeline"
}

variable "container_port" {
  description = "Port the container listens on"
  default     = 3000
}

variable "cpu" {
  description = "Fargate task CPU units"
  default     = "256"
}

variable "memory" {
  description = "Fargate task memory in MB"
  default     = "512"
}

variable "aws_account_id" {
  description = "AWS account ID"
  default     = "236580259127"
}