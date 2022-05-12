resource "aws_iam_role" "ec2_s3_access_role" {
  name               = "s3-role-2"
  assume_role_policy = "${file("assumepolicy.json")}"
}

resource "aws_iam_policy" "policy" {
  name        = "test-policy-2"
  description = "A test policy"
  policy      = "${file("policys3bucket.json")}"
}

resource "aws_iam_policy_attachment" "test-attach" {
  name       = "test-attachment-2"
  roles      = ["${aws_iam_role.ec2_s3_access_role.name}"]
  policy_arn = "${aws_iam_policy.policy.arn}"
}

resource "aws_iam_instance_profile" "test_profile" {
  name  = "test_profile-2"
  role = "${aws_iam_role.ec2_s3_access_role.name}"
}