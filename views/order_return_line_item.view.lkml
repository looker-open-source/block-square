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
    description: "The base price for a single unit of the line item."
  }

  dimension: catalog_object_id {
    type: number
    hidden: yes
    sql: ${TABLE}.catalog_object_id ;;
    description: "The CatalogItemVariation id applied to this returned line item."
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
    description: "The name of the line item."
  }

  dimension: note {
    label: "Return Note"
    type: string
    sql: ${TABLE}.note ;;
    description: "The note of the returned line item."
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
    description: "The quantity returned, formatted as a decimal number. For example: "3"."
  }

  dimension: quantity_unit {
    label: "Return Quantity Unit"
    type: string
    sql: ${TABLE}.quantity_unit ;;
    description: "The unit and precision that this return line item's quantity is measured in."
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
    description: "Read only The total discount amount of money to return for the line item."
  }

  dimension: total_money {
    label: "Return Total Money"
    type: number
    sql: ${TABLE}.total_money ;;
    description: "Read only The total amount of money to return for this line item."
  }

  dimension: total_tax_money {
    label: "Return Total Tax"
    type: number
    sql: ${TABLE}.total_tax_money ;;
    description: "Read only The total tax amount of money to return for the line item."
  }

  dimension: uid {
    hidden: yes
    type: number
    value_format_name: id
    sql: ${TABLE}.uid ;;
    description: "Unique identifier for this return line item entry."
  }

  dimension: variation_name {
    label: "Return Variation Name"
    type: string
    sql: ${TABLE}.variation_name ;;
    description: "The name of the variation applied to this returned line item."
  }

  dimension: variation_total_price_money {
    label: "Return Variation Total Price"
    type: number
    sql: ${TABLE}.variation_total_price_money ;;
    description: "Read only The total price of all item variations returned in this line item. Calculated as base_price_money multiplied by quantity. Does not include modifiers."
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

  measure: total_return_amount {
    label: "Return Amount Total"
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
