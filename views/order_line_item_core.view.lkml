include: "//@{CONFIG_PROJECT_NAME}/*/order_line_item.view.lkml"

view: order_line_item {
  extends: [order_line_item_config]
}

view: order_line_item_core {
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
    description: "The base price for a single unit of the line item."
  }

  dimension: catalog_object_id {
    label: "Line Item Catalog Object ID"
    type: number
    sql: ${TABLE}.catalog_object_id ;;
    description: "The CatalogItemVariation id applied to this line item."
  }

  dimension: gross_sales_money {
    label: "Line Item Gross Sales Money"
    type: number
    sql: ${TABLE}.gross_sales_money ;;
    description: "Read only The amount of money made in gross sales for this line item. Calculated as the sum of the variation's total price and each modifier's total price."
  }

  dimension: name {
    label: "Line Item Name"
    type: string
    sql: ${TABLE}.name ;;
    description: "The name of the line item."
  }

  dimension: note {
    label: "Line Item Note"
    type: string
    sql: ${TABLE}.note ;;
    description: "The note of the line item."
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension: quantity {
    label: "Line Item Quantity"
    type: number
    sql: ${TABLE}.quantity ;;
    description: "The quantity purchased, formatted as a decimal number. For example: \"3\"."
  }

  dimension: total_discount_money {
    label: "Line Item Discount Money"
    type: number
    sql: ${TABLE}.total_discount_money ;;
    description: "Read only The total discount amount of money to collect for the line item."
  }

  dimension: total_money {
    label: "Line Item Money"
    type: number
    sql: ${TABLE}.total_money ;;
    description: "Read only The total amount of money to collect for this line item."
  }

  dimension: total_tax_money {
    label: "Line Item Tax Money"
    type: number
    sql: ${TABLE}.total_tax_money ;;
    description: "Read only The total tax amount of money to collect for the line item."
  }

  dimension: uid {
    label: "Line Item UID"
    type: number
    value_format_name: id
    sql: ${TABLE}.uid ;;
    description: "Unique ID that identifies the line item only within this order."
  }

  dimension: variation_name {
    label: "Line Item Variation Name"
    type: string
    sql: ${TABLE}.variation_name ;;
    description: "The name of the variation applied to this line item."
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