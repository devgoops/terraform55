provider "aws" {
  region = "us-east-1"
}

resource "aws_db_instance" "rds" {
  db_name = "rds"
  identifier          = "first-rds"
  instance_class      = "db.t2.micro"
  engine              = "mariadb"
  username            = "bob"
  password            = "password123"
  port                = 3306
  allocated_storage   = 20
  skip_final_snapshot = true
}