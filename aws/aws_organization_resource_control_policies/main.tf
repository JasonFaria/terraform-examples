data "aws_organizations_organization" "organization" {}

resource "aws_organizations_policy" "this" {
    for_each    = fileset(path.root, "${var.policies_dir}/*.json.tftpl")

    name        = trimsuffix(basename(each.value), ".json.tftpl")
    description = "Resource control policy from file ${each.value}"
    type        = "RESOURCE_CONTROL_POLICY"

    content     = templatefile(each.value, {
        org_id = data.aws_organizations_organization.organization.id
        config = var.config
    })
}

module "aws_resource_control_policy_attachments" {
    for_each = var.ou_list

    source = "./modules/aws_resource_control_policy_attachment"

    ou           = each.key
    policies     = each.value
    policy_id    = aws_organizations_policy.this
    policies_dir = var.policies_dir

    depends_on = [ aws_organizations_policy.this ]
}
