terraform {
  required_version = ">= 1.5, < 2.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region              = "eu-central-1"
  allowed_account_ids = ["997241705349"]
}

resource "aws_s3_bucket" "website" {
  bucket = "baris.hu"

  lifecycle {
    prevent_destroy = true
  }
}

import {
  to = aws_s3_bucket.website
  id = "baris.hu"
}