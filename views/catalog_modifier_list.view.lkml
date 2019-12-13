view: catalog_modifier_list {
  sql_table_name: Square.CATALOG_MODIFIER_LIST ;;

  dimension: catalog_object_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.catalog_object_id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: selection_type {
    type: string
    sql: ${TABLE}.selection_type ;;
  }

  measure: count {
    type: count
    drill_fields: [name, catalog_object.id]
  }
}
