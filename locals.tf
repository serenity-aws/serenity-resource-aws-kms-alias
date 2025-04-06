locals {
  kms_aliases = {
    for name, kms_alias in try(local.data, {}) :
    name => kms_alias if var.create && try(data.create, true) && try(key.create, true)
  }
}
