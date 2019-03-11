resource "aws_s3_bucket" "website_bucket" {
  bucket = "${var.bucket_name}"
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::${var.bucket_name}/*"
        }
    ]
}
EOF

  website {
    index_document = "index.html"
    error_document = "error.html"
  }
}

resource "aws_s3_bucket_object" "index" {
  bucket       = "${aws_s3_bucket.website_bucket.id}"
  key          = "index.html"
  source       = "../index.html"
  etag         = "${md5(file("../index.html"))}"
  content_type = "text/html"
}

resource "aws_s3_bucket_object" "style" {
  bucket       = "${aws_s3_bucket.website_bucket.id}"
  key          = "style.css"
  source       = "../style.css"
  etag         = "${md5(file("../style.css"))}"
  content_type = "text/css"
}

resource "aws_s3_bucket_object" "image_blog" {
  bucket       = "${aws_s3_bucket.website_bucket.id}"
  key          = "images/blog.png"
  source       = "../images/blog.png"
  etag         = "${md5(file("../images/blog.png"))}"
  content_type = "image/png"
}

resource "aws_s3_bucket_object" "image_email" {
  bucket       = "${aws_s3_bucket.website_bucket.id}"
  key          = "images/email.png"
  source       = "../images/email.png"
  etag         = "${md5(file("../images/email.png"))}"
  content_type = "image/png"
}

resource "aws_s3_bucket_object" "image_github" {
  bucket       = "${aws_s3_bucket.website_bucket.id}"
  key          = "images/github.png"
  source       = "../images/github.png"
  etag         = "${md5(file("../images/github.png"))}"
  content_type = "image/png"
}

resource "aws_s3_bucket_object" "image_linkedin" {
  bucket       = "${aws_s3_bucket.website_bucket.id}"
  key          = "images/linkedin.png"
  source       = "../images/linkedin.png"
  etag         = "${md5(file("../images/linkedin.png"))}"
  content_type = "image/png"
}

resource "aws_s3_bucket_object" "image_twitter" {
  bucket       = "${aws_s3_bucket.website_bucket.id}"
  key          = "images/twitter.png"
  source       = "../images/twitter.png"
  etag         = "${md5(file("../images/twitter.png"))}"
  content_type = "image/png"
}

resource "aws_s3_bucket_object" "image_profile" {
  bucket       = "${aws_s3_bucket.website_bucket.id}"
  key          = "images/profile.jpg"
  source       = "../images/profile.jpg"
  etag         = "${md5(file("../images/profile.jpg"))}"
  content_type = "image/jpg"
}
