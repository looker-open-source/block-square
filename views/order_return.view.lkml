view: order_return {
  sql_table_name: Square.ORDER_RETURN ;;

  dimension: pk {
    hidden: yes
    primary_key: yes
    sql: CONCAT(${uid}, ${source_order_id}) ;;
  }

  dimension: source_order_id {
    type: number
    sql: ${TABLE}.source_order_id ;;
  }

  dimension: uid {
    type: number
    value_format_name: id
    hidden: yes
    sql: ${TABLE}.uid ;;
  }

  measure: count {
    label: "Return Count"
    type: count
    drill_fields: []
  }
}
