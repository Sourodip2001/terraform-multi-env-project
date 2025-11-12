variable "env" {
        description =  "This infra environment "
        type = string

}

variable "bucketname" {
        description =  "This bucket name "
        type = string
}

variable "instance_count" {
        description =  "This intance count for environment based "
        type = number
}

variable "instance_type" {
         description =  "This instance type for environment based "
        type = string
}
variable  "ami_id" {
         description =  "This instance type for environment based "
        type = string
}


variable "ec2_default_size" {
         description =  "This instance size for environment based "
        type = number
}
variable "hash_key" {

description =  "This hash key  for dynamodb  environment based "
        type = string
}
