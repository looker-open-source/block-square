include: "//@{CONFIG_PROJECT_NAME}/*/catalog_modifier_in_catalog_modifier_list.view.lkml"

view: catalog_modifier_in_catalog_modifier_list {
  extends: [catalog_modifier_in_catalog_modifier_list_config]
}

view: catalog_modifier_in_catalog_modifier_list_core {
  sql_table_name: @{SCHEMA_NAME}.CATALOG_MODIFIER_IN_CATALOG_MODIFIER_LIST ;;

  dimension: pk {
    hidden: yes
    primary_key: yes
    sql: CONCAT(CAST(${catalog_modifier_list_id} AS STRING), CAST(${catalog_modifier} AS STRING)) ;;
  }

  dimension: catalog_modifier {
    type: string
    sql: ${TABLE}.catalog_modifier ;;
  }

  dimension: catalog_modifier_list_id {
    type: number
    sql: ${TABLE}.catalog_modifier_list_id ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}