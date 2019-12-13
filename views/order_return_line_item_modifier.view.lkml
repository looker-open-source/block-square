view: order_return_line_item_modifier {
  sql_table_name: Square.ORDER_RETURN_LINE_ITEM_MODIFIER ;;

  dimension: base_price_money {
    type: number
    sql: ${TABLE}.base_price_money ;;
  }

  dimension: catalog_object_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.catalog_object_id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: order_return_line_item_id {
    type: number
    sql: ${TABLE}.order_return_line_item_id ;;
  }

  dimension: source_modifier_uid {
    type: number
    value_format_name: id
    sql: ${TABLE}.source_modifier_uid ;;
  }

  dimension: total_price_money {
    type: number
    sql: ${TABLE}.total_price_money ;;
  }

  dimension: uid {
    type: number
    value_format_name: id
    sql: ${TABLE}.uid ;;
  }

  measure: count {
    type: count
    drill_fields: [name, catalog_object.id]
  }
}
