module "dev-infra" {
        source = "provide-source-path"
        env= "dev"
        bucketname = "provide-bucket-name"
        instance_count = 1
        instance_type = "t2.micro"
        ami_id = "provide-ami-id"
        hash_key  = "LockID"
        ec2_default_size = 8
}
