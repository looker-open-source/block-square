view: order_return_line_item {
  sql_table_name: Square.ORDER_RETURN_LINE_ITEM ;;

  dimension: pk {
    hidden: yes
    primary_key: yes
    sql: CONCAT(CAST(${uid} AS STRING), CAST(${order_return_id} AS STRING)) ;;
  }

  dimension: base_price_money {
    label: "Return Base Price"
    type: number
    sql: ${TABLE}.base_price_money ;;
  }

  dimension: catalog_object_id {
    type: number
    hidden: yes
    sql: ${TABLE}.catalog_object_id ;;
  }

  dimension: gross_sales_money {
    label: "Return Gross Sales"
    type: number
    sql: ${TABLE}.gross_sales_money ;;
  }

  dimension: name {
    label: "Return Item Name"
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: note {
    label: "Return Note"
    type: string
    sql: ${TABLE}.note ;;
  }

  dimension: order_return_id {
    type: number
    hidden: yes
    sql: ${TABLE}.order_return_id ;;
  }

  dimension: quantity {
    label: "Return Quantity"
    type: number
    sql: ${TABLE}.quantity ;;
  }

  dimension: quantity_unit {
    label: "Return Quantity Unit"
    type: string
    sql: ${TABLE}.quantity_unit ;;
  }

  dimension: source_line_item_id {
    type: number
    hidden: yes
    sql: ${TABLE}.source_line_item_id ;;
  }

  dimension: total_discount_money {
    label: "Return Total Discount"
    type: number
    sql: ${TABLE}.total_discount_money ;;
  }

  dimension: total_money {
    label: "Return Total Money"
    type: number
    sql: ${TABLE}.total_money ;;
  }

  dimension: total_tax_money {
    label: "Return Total Tax"
    type: number
    sql: ${TABLE}.total_tax_money ;;
  }

  dimension: uid {
    hidden: yes
    type: number
    value_format_name: id
    sql: ${TABLE}.uid ;;
  }

  dimension: variation_name {
    label: "Return Variation Name"
    type: string
    sql: ${TABLE}.variation_name ;;
  }

  dimension: variation_total_price_money {
    label: "Return Variation Total Price"
    type: number
    sql: ${TABLE}.variation_total_price_money ;;
  }

  measure: total_tax {
    label: "Return Total Tax"
    type: sum
    sql: ${total_tax_money} ;;
  }

  measure: total_discount {
    label: "Return Total Discount"
    type: sum
    sql: ${total_discount_money} ;;
  }

  measure: total_revenue {
    label: "Return Revenue"
    type: sum
    sql: ${total_money} ;;
  }

  measure: total_items {
    label: "Return Quantity"
    type: sum
    sql: ${quantity} ;;
  }

  measure: count {
    label: "Return Line Item Count"
    type: count
    drill_fields: [variation_name, name, catalog_object.id]
  }
}
