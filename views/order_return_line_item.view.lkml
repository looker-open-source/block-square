view: order_return_line_item {
  sql_table_name: Square.ORDER_RETURN_LINE_ITEM ;;

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

  dimension: order_return_id {
    type: number
    sql: ${TABLE}.order_return_id ;;
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}.quantity ;;
  }

  dimension: quantity_unit {
    type: string
    sql: ${TABLE}.quantity_unit ;;
  }

  dimension: source_line_item_id {
    type: number
    sql: ${TABLE}.source_line_item_id ;;
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

  dimension: variation_total_price_money {
    type: number
    sql: ${TABLE}.variation_total_price_money ;;
  }

  measure: count {
    type: count
    drill_fields: [variation_name, name, catalog_object.id]
  }
}
