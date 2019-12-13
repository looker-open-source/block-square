view: order_line_item {
  sql_table_name: Square.ORDER_LINE_ITEM ;;

  dimension: base_price_money {
    type: number
    sql: ${TABLE}.base_price_money ;;
  }

  dimension: catalog_object_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.catalog_object_id ;;
  }

  dimension: gross_sales_money {
    type: number
    sql: ${TABLE}.gross_sales_money ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: note {
    type: string
    sql: ${TABLE}.note ;;
  }

  dimension: order_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.order_id ;;
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}.quantity ;;
  }

  dimension: total_discount_money {
    type: number
    sql: ${TABLE}.total_discount_money ;;
  }

  dimension: total_money {
    type: number
    sql: ${TABLE}.total_money ;;
  }

  dimension: total_tax_money {
    type: number
    sql: ${TABLE}.total_tax_money ;;
  }

  dimension: uid {
    type: number
    value_format_name: id
    sql: ${TABLE}.uid ;;
  }

  dimension: variation_name {
    type: string
    sql: ${TABLE}.variation_name ;;
  }

  measure: count {
    type: count
    drill_fields: [variation_name, name, catalog_object.id, order.order_source_name, order.id]
  }
}
