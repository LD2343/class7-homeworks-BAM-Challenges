# AWS WAF

resource "aws_wafv2_web_acl" "waf" {
  name  = "tf-waf"
  scope = "REGIONAL"

  default_action {
    allow {}
  }

  visibility_config {
    cloudwatch_metrics_enabled = true
    metric_name                = "waf"
    sampled_requests_enabled   = true
  }

  lifecycle {
    ignore_changes = [rule]
  }
}

# Rule 1 - AWS Managed Common Rule Set

resource "aws_wafv2_web_acl_rule" "commonrulesetrule" {
  name        = "common_rule_set"
  priority    = 0
  web_acl_arn = aws_wafv2_web_acl.waf.arn

  override_action {
    none {}
  }

  statement {
    managed_rule_group_statement {
      name        = "AWSManagedRulesCommonRuleSet"
      vendor_name = "AWS"
    }
  }

  visibility_config {
    cloudwatch_metrics_enabled = true
    metric_name                = "CommonRules"
    sampled_requests_enabled   = true
  }
}

# Rule 2 - AWS Managed Known Bad Inputs Rule Set

resource "aws_wafv2_web_acl_rule" "knownbadinputsrule" {
  name        = "known_bad_inputs_rule_set"
  priority    = 1
  web_acl_arn = aws_wafv2_web_acl.waf.arn

  override_action {
    none {}
  }

  statement {
    managed_rule_group_statement {
      name        = "AWSManagedRulesKnownBadInputsRuleSet"
      vendor_name = "AWS"
    }
  }

  visibility_config {
    cloudwatch_metrics_enabled = true
    metric_name                = "KnownBadInputRules"
    sampled_requests_enabled   = true
  }
}

# Rule 3 - AWS Managed Anonymous IP List Rule Set

resource "aws_wafv2_web_acl_rule" "anonymousiplistrule" {
  name        = "anonymous_ip_list_rule_set"
  priority    = 2
  web_acl_arn = aws_wafv2_web_acl.waf.arn

  override_action {
    none {}
  }

  statement {
    managed_rule_group_statement {
      name        = "AWSManagedRulesAnonymousIpList"
      vendor_name = "AWS"
    }
  }

  visibility_config {
    cloudwatch_metrics_enabled = true
    metric_name                = "AnonymousIPListRules"
    sampled_requests_enabled   = true
  }
}

# Rule 4 - Rate Based Rule

resource "aws_wafv2_web_acl_rule" "ratebasedrule" {
  name        = "rate_based_rule"
  priority    = 3
  web_acl_arn = aws_wafv2_web_acl.waf.arn

  action {
    block {}
  }

  statement {
    rate_based_statement {
      limit                 = 100
      aggregate_key_type    = "IP" // optional default is IP
      evaluation_window_sec = 300  // optional but this is the time window
    }
  }

  visibility_config {
    cloudwatch_metrics_enabled = true
    metric_name                = "RateBasedRules"
    sampled_requests_enabled   = true
  }
}

# Attach WAF to API Gateway

resource "aws_wafv2_web_acl_association" "api_assoc" {
  resource_arn = aws_api_gateway_stage.prod_stage.arn
  web_acl_arn  = aws_wafv2_web_acl.waf.arn
}