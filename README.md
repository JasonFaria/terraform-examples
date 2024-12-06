# terraform-examples

Terraform examples that you can learn from, or even copy to use.


## Examples

- [aws](aws)
  - [aws/aws_organization_resource_control_policies](aws/aws_organization_resource_control_policies)


### AWS Organization Resource Control Policies

- [aws/aws_organization_resource_control_policies](aws/aws_organization_resource_control_policies)

This module creates AWS Organization Resource Control Policies (RCPs) on AWS.  RCPs are used to control access to AWS resources based on specific conditions. They are typically used to enforce security controls such as encryption, TLS version, and other security best practices.  Organization RCPs are applied to OUs.  These are guardrails to prevent access to AWS resources such as from malicious actors outside of your organization or limit resources to only certain accounts.

AWS Resources that are supported:

- AWS Organizations Policy
- AWS Organizations Policy Attachment 