view: catalog_modifier {
  sql_table_name: Square.CATALOG_MODIFIER ;;

  dimension: catalog_object_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.catalog_object_id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: price_money {
    type: number
    sql: ${TABLE}.price_money ;;
  }

  measure: count {
    type: count
    drill_fields: [name, catalog_object.id]
  }
}
