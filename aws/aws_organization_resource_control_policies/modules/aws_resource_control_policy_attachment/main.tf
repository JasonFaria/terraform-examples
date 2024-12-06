resource "aws_organizations_policy_attachment" "this" {
  for_each  = toset(var.policies)
  policy_id = var.policy_id["${var.policies_dir}/${each.value}.json.tftpl"].id
  target_id = var.ou
}