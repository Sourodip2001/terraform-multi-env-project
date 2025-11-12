resource "aws_s3_bucket" "mybucket" {

        bucket = "${var.bucketname}-${var.env}"
        tags = {
                Name = "${var.env}"
                Environment = "${var.env}"
        }
}
