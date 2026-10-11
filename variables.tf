variable "data_safe_subsetting_policy_subsetting_rules_lookup" {
  description = <<EOT
Map of data_safe_subsetting_policy_subsetting_rules_lookup, attributes below
Required:
    - subsetting_policy_id
Optional:
    - object
    - schema_name
    - filter (block):
        - name (required)
        - regex (optional)
        - values (required)
EOT

  type = map(object({
    subsetting_policy_id = string
    object               = optional(list(string))
    schema_name          = optional(list(string))
    filter = optional(list(object({
      name   = string
      regex  = optional(bool)
      values = list(string)
    })))
  }))
  validation {
    condition = alltrue([
      for k, v in var.data_safe_subsetting_policy_subsetting_rules_lookup : (
        alltrue([for item in v.subsetting_rule_collection : (item.items == null || alltrue([for item in item.items : (item.scope == null || alltrue([for item in item.scope : (item.schema_name == null || (length(item.schema_name) >= 1 && length(item.schema_name) <= 128))]))]))])
      )
    ])
    error_message = "must be between 1 and 128 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_safe_subsetting_policy_subsetting_rules_lookup : (
        alltrue([for item in v.subsetting_rule_collection : (item.items == null || alltrue([for item in item.items : (item.scope == null || alltrue([for item in item.scope : (item.scope_type == null || (contains([for v in ["ALL", "SPECIFIC"] : lower(v)], lower(item.scope_type))))]))]))])
      )
    ])
    error_message = "must be one of: \"ALL\", \"SPECIFIC\""
  }
  validation {
    condition = alltrue([
      for k, v in var.data_safe_subsetting_policy_subsetting_rules_lookup : (
        alltrue([for item in v.subsetting_rule_collection : (item.items == null || alltrue([for item in item.items : (item.scope == null || alltrue([for item in item.scope : (item.object == null || (length(item.object) >= 1 && length(item.object) <= 128))]))]))])
      )
    ])
    error_message = "must be between 1 and 128 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_safe_subsetting_policy_subsetting_rules_lookup : (
        alltrue([for item in v.subsetting_rule_collection : (item.items == null || alltrue([for item in item.items : (item.subset_rule_entry == null || alltrue([for item in item.subset_rule_entry : (item.rule_type == null || (contains([for v in ["CONDITION", "PARTITION", "PERCENT"] : lower(v)], lower(item.rule_type))))]))]))])
      )
    ])
    error_message = "must be one of: \"CONDITION\", \"PARTITION\", \"PERCENT\""
  }
  validation {
    condition = alltrue([
      for k, v in var.data_safe_subsetting_policy_subsetting_rules_lookup : (
        alltrue([for item in v.subsetting_rule_collection : (item.items == null || alltrue([for item in item.items : (item.subset_rule_entry == null || alltrue([for item in item.subset_rule_entry : (item.percent == null || (item.percent >= 0 && item.percent <= 100))]))]))])
      )
    ])
    error_message = "must be between 0 and 100"
  }
  validation {
    condition = alltrue([
      for k, v in var.data_safe_subsetting_policy_subsetting_rules_lookup : (
        alltrue([for item in v.subsetting_rule_collection : (item.items == null || alltrue([for item in item.items : (item.peer_tables_action == null || (contains([for v in ["MINIMUM_ROWS", "SUBSET", "MAXIMUM_ROWS"] : lower(v)], lower(item.peer_tables_action))))]))])
      )
    ])
    error_message = "must be one of: \"MINIMUM_ROWS\", \"SUBSET\", \"MAXIMUM_ROWS\""
  }
  validation {
    condition = alltrue([
      for k, v in var.data_safe_subsetting_policy_subsetting_rules_lookup : (
        alltrue([for item in v.subsetting_rule_collection : (item.items == null || alltrue([for item in item.items : (item.related_tables_propagation == null || (contains([for v in ["ANCESTORS_AND_DESCENDANTS", "ANCESTORS", "DESCENDANTS", "NONE"] : lower(v)], lower(item.related_tables_propagation))))]))])
      )
    ])
    error_message = "must be one of: \"ANCESTORS_AND_DESCENDANTS\", \"ANCESTORS\", \"DESCENDANTS\", \"NONE\""
  }
  validation {
    condition = alltrue([
      for k, v in var.data_safe_subsetting_policy_subsetting_rules_lookup : (
        alltrue([for item in v.subsetting_rule_collection : (item.items == null || alltrue([for item in item.items : (item.rule_combination_mode == null || (contains([for v in ["UNION", "SERIAL"] : lower(v)], lower(item.rule_combination_mode))))]))])
      )
    ])
    error_message = "must be one of: \"UNION\", \"SERIAL\""
  }
}

