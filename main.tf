data "oci_data_safe_subsetting_policy_subsetting_rules" "data_safe_subsetting_policy_subsetting_rules_lookup" {
  for_each = var.data_safe_subsetting_policy_subsetting_rules_lookup

  subsetting_policy_id = each.value.subsetting_policy_id
  object               = each.value.object
  schema_name          = each.value.schema_name

  dynamic "filter" {
    for_each = each.value.filter != null ? each.value.filter : []
    content {
      name   = filter.value.name
      regex  = filter.value.regex
      values = filter.value.values
    }
  }
}

