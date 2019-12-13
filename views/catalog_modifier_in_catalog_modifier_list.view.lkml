view: catalog_modifier_in_catalog_modifier_list {
  sql_table_name: Square.CATALOG_MODIFIER_IN_CATALOG_MODIFIER_LIST ;;

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
