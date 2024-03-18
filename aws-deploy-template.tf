 provider "aws" {
  region = "us-east-1"
  access_key = "<your_access_key>"
  secret_key = "<your_secret_key>"
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
}

resource "aws_s3_bucket" "try_bucket" {
  bucket = "exemple"
}

resource "aws_instance" "mc2" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"

  // Assuming you want to assign the S3 bucket to this instance
  tags = {
    Name = "mc2"
  }

  provisioner "local-exec" {
    command = "aws s3 cp /path/to/your/file s3://${aws_s3_bucket.yeru_bucket.bucket}/"
  }
}

