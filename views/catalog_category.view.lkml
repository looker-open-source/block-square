view: catalog_category {
  sql_table_name: Square.CATALOG_CATEGORY ;;

  dimension: catalog_object_id {
    type: number
    sql: ${TABLE}.catalog_object_id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
