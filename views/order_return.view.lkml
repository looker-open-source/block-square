view: order_return {
  sql_table_name: Square.ORDER_RETURN ;;

  dimension: source_order_id {
    type: number
    sql: ${TABLE}.source_order_id ;;
  }

  dimension: uid {
    type: number
    value_format_name: id
    sql: ${TABLE}.uid ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
