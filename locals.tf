locals {
  data = {
    for _id, _data in try(var.data, {}) :
    _id => _data if var.create && try(_data.create, true)
  }
}
