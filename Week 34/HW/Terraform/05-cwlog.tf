# CW Log Group

resource "aws_cloudwatch_log_group" "waf_log_group" {
  name = "aws-waf-logs-classlab" // must start with "aws-waf-logs-"
}

# WAF to CW Log Group

resource "aws_wafv2_web_acl_logging_configuration" "waf_log_group_association" {
  log_destination_configs = [aws_cloudwatch_log_group.waf_log_group.arn]
  resource_arn            = aws_wafv2_web_acl.waf.arn
}

resource "aws_cloudwatch_log_resource_policy" "example" {
  policy_document = data.aws_iam_policy_document.example.json
  policy_name     = "webacl-policy-uniq-name"
}

data "aws_iam_policy_document" "example" {
  version = "2012-10-17"
  statement {
    effect = "Allow"
    principals {
      identifiers = ["logs.amazonaws.com"]
      type        = "Service"
    }
    actions   = ["logs:CreateLogStream", "logs:PutLogEvents"]
    resources = ["${aws_cloudwatch_log_group.waf_log_group.arn}:*"]
    condition {
      test     = "ArnLike"
      values   = [ "${aws_wafv2_web_acl.waf.arn}:*" ]
      variable = "aws:SourceArn"
    }
  }
}