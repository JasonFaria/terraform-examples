## AWS Organization Resource Control Policies with Terraform

This directory contains Terraform code for creating Organization Resource Control Policies (RCPs) on AWS.

RCPs are used to control access to AWS resources based on specific conditions. They are typically used to enforce security controls such as encryption, TLS version, and other security best practices.  Organization RCPs are applied to OUs.  These are guardrails to prevent access to AWS resources such as from malicious actors outside of your organization or limit resources to only certain accounts. The policies can also be applied to limit specific resource configurations such as requiring TLS 1.2 for S3 buckets.

## Prerequisites

- [AWS Organizations](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_introduction.html)

## Limitations

Be aware of Resource Control Policies limits such as maximum size of a policy document:

- [AWS Organizations Limits](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_reference_limits.html)

AWS Services that you can create RCPs for:

- [AWS Services that Support Resource Control Policies](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_rcps.html#rcp-supported-services)

## Module Inputs

```hcl
module "aws_organization_resource_control_policies" {
    source = "github.com/jasonfaria/terraform-examples/aws/aws_organization_resource_control_policies"

    ou_policies = {
        "r-123abc":  = [ "confused_deputy_protection" ]
        "ou-123abc-11223344": = [ "secure_transport" ]
        "ou-123abc-55667788": = [ "s3_protection", "secure_transport" ]

    }
}
```

*Note: Requires aws provider version 5.76.0 or later.  This is because the `aws_organizations_policy` resource was updated to support `RESOURCE_CONTROL_POLICY` for the `type` parameter in that release.*

## Related Resources

- [RCPs (AWS Organizations User Guide)](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_rcps.html)
- [AWS Resource Control Policies Syntax](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_rcps_syntax.html)
- [Resource: aws_organizations_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_policy)
- [Resource: aws_organizations_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_policy_attachment)

## License

This library is licensed under the MIT-0 License. See the [LICENSE](LICENSE) file.