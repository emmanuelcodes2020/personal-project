variable "instance_type" {
  default = "t2.micro"
  type    = string
}

variable "subnet_id" {
  default = "subnet-04fb6726c16bdd4ca"
  type    = string

}

variable "key_name" {
  default = "londonserver"
  type    = string
}

variable "env" {
  default = "dev"
  type    = string
}

variable "subnet_ranges" {
  type = list(string)
  default = ["subnet-02a9e5d00bbb8cc25", "subnet-0644c8c5d8ada7398", "subnet-04fb6726c16bdd4ca"]
}

variable "vpc_id" {
  type = string
  default = "vpc-043e1dc52827b0366"
  
}
variable "volume_size" {
  type = number
  default = 13
  
}

variable "zone_id" {
  type = string
  default = "Z0671589BT7MHBSY40SQ"
}