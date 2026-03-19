variable "aws_region" {
    description = "The region where S3 bucket is deployed"
    default = "ap-south-1"
    type = string
}

variable "bucket_name" {
    default = "cloudfront-s3-akila-12345-bucket"
    type = string
}