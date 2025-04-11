resource "aws_kms_alias" "this" {
  for_each = local.data

  name          = can(each.value.name_prefix) ? null : try(each.value.name, "alias/${each.key}")
  name_prefix   = try(each.value.name_prefix, null)
  target_key_id = can(each.value.target_key_id) ? each.value.target_key_id : var.upstream.aws_kms_key[each.value.kms_key].arn
}
