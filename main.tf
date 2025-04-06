resource "aws_kms_alias" "this" {
  for_each = local.kms_aliases

  name        = try(each.value.name, null)
  name_prefix = try(each.value.name_prefix, null)
  target_key_id = each.value.target_key_id
}
