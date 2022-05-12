resource "aws_iam_role" "ec2_s3_access_role" {
  name               = "s3-role-1"
  assume_role_policy = "${file("assumepolicy.json")}"
}

resource "aws_iam_policy" "policy" {
  name        = "test-policy-1"
  description = "A test policy"
  policy      = "${file("policys3bucket.json")}"
}

resource "aws_iam_policy_attachment" "test-attach" {
  name       = "test-attachment-1"
  roles      = ["${aws_iam_role.ec2_s3_access_role.name}"]
  policy_arn = "${aws_iam_policy.policy.arn}"
}

resource "aws_iam_instance_profile" "test_profile" {
  name  = "test_profile1"
  role = "${aws_iam_role.ec2_s3_access_role.name}"
}