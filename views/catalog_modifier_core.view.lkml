include: "//@{CONFIG_PROJECT_NAME}/*/catalog_modifier.view.lkml"

view: catalog_modifier {
  extends: [catalog_modifier_config]
}

view: catalog_modifier_core {
  sql_table_name: @{SCHEMA_NAME}.CATALOG_MODIFIER ;;

  dimension: catalog_object_id {
    type: number
    hidden: yes
    primary_key: yes
    sql: ${TABLE}.catalog_object_id ;;
  }

  dimension: name {
    label: "Modifier Name"
    type: string
    sql: ${TABLE}.name ;;
    description: "The modifier name. Searchable. This field has max length of 255 Unicode code points."
  }

  dimension: price_money {
    label: "Modifier Price"
    type: number
    sql: ${TABLE}.price_money ;;
    description: "The modifier price."
  }

  measure: count {
    label: "Modifier Count"
    type: count
    drill_fields: [name, catalog_object.id]
  }
}