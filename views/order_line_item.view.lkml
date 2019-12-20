view: order_line_item {
  sql_table_name: Square.ORDER_LINE_ITEM ;;

  dimension: pk {
    hidden: yes
    primary_key: yes
    sql: CONCAT(CAST(${uid} AS STRING), CAST(${order_id} AS STRING)) ;;
  }

  dimension: base_price_money {
    label: "Line Item Base Price Money"
    type: number
    sql: ${TABLE}.base_price_money ;;
  }

  dimension: catalog_object_id {
    label: "Line Item Catalog Object ID"
    type: number
    # hidden: yes
    sql: ${TABLE}.catalog_object_id ;;
  }

  dimension: gross_sales_money {
    label: "Line Item Gross Sales Money"
    type: number
    sql: ${TABLE}.gross_sales_money ;;
  }

  dimension: name {
    label: "Line Item Name"
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: note {
    label: "Line Item Note"
    type: string
    sql: ${TABLE}.note ;;
  }

  dimension: order_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.order_id ;;
  }

  dimension: quantity {
    label: "Line Item Quantity"
    type: number
    sql: ${TABLE}.quantity ;;
  }

  dimension: total_discount_money {
    label: "Line Item Discount Money"
    type: number
    sql: ${TABLE}.total_discount_money ;;
  }

  dimension: total_money {
    label: "Line Item Money"
    type: number
    sql: ${TABLE}.total_money ;;
  }

  dimension: total_tax_money {
    label: "Line Item Tax Money"
    type: number
    sql: ${TABLE}.total_tax_money ;;
  }

  dimension: uid {
    label: "Line Item UID"
    type: number
    value_format_name: id
    sql: ${TABLE}.uid ;;
  }

  dimension: variation_name {
    label: "Line Item Variation Name"
    type: string
    sql: ${TABLE}.variation_name ;;
  }

  measure: count {
    label: "Line Item Count"
    type: count
    drill_fields: [variation_name, name, catalog_object.id, order.order_source_name, order.id]
  }

  measure: total_tax {
    label: "Line Item Total Tax"
    type: sum
    sql: ${total_tax_money} ;;
  }

  measure: total_discount {
    label: "Line Item Total Discount"
    type: sum
    sql: ${total_discount_money} ;;
  }

  measure: total_revenue {
    label: "Line Item Revenue"
    type: sum
    sql: ${total_money} ;;
  }

  measure: total_items {
    label: "Line Item Quantity"
    type: sum
    sql: ${quantity} ;;
  }

}
