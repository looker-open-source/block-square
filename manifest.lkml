project_name: "block-square"

################ Constants ################

constant: CONFIG_PROJECT_NAME {
  value: "block-square-config"
  export: override_required
}

constant: CONNECTION_NAME {
  value: "static_data"
  export: override_required
}

constant: SCHEMA_NAME {
  value: "Square"
  export: override_required
}

################ Dependencies ################

local_dependency: {
  project: "@{CONFIG_PROJECT_NAME}"

  override_constant: SCHEMA_NAME {
    value: "@{SCHEMA_NAME}"
  }
}
