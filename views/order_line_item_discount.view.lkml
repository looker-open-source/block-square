view: order_line_item_discount {
  sql_table_name: Square.ORDER_LINE_ITEM_DISCOUNT ;;

  dimension: pk {
    hidden: yes
    primary_key: yes
    sql: CONCAT(CAST(${uid} AS STRING), CAST(${order_id} AS STRING)) ;;
  }

  dimension: amount_money {
    label: "Discount Amount Money"
    type: number
    sql: ${TABLE}.amount_money ;;
    description: "The total declared monetary amount of the discount."
  }

  dimension: applied_money {
    label: "Discount Applied Money"
    type: number
    sql: ${TABLE}.applied_money ;;
    description: "The amount of discount actually applied to the line item."
  }

  dimension: catalog_object_id {
    type: number
    hidden: yes
    sql: ${TABLE}.catalog_object_id ;;
    description: "The catalog object id referencing CatalogDiscount."
  }

  dimension: name {
    label: "Discount Name"
    type: string
    sql: ${TABLE}.name ;;
    description: "The discount's name."
  }

  dimension: order_id {
    type: number
    hidden: yes
    sql: ${TABLE}.order_id ;;
  }

  dimension: percentage {
    label: "Discount Percentage"
    type: number
    sql: ${TABLE}.percentage ;;
    description: "The percentage of the discount, as a string representation of a decimal number. A value of 7.25 corresponds to a percentage of 7.25%."
  }

  dimension: scope {
    label: "Discount Scope"
    type: string
    sql: ${TABLE}.scope ;;
    description: "Indicates the level at which the discount applies. For ORDER scoped discounts, Square generates references in applied_discounts on all order line items that do not have them. For LINE_ITEM scoped discounts, the discount only applies to line items with a discount reference in their applied_discounts field."
  }

  dimension: type {
    label: "Discount Type"
    type: string
    sql: ${TABLE}.type ;;
    description: "The type of the discount."
  }

  dimension: uid {
    type: number
    value_format_name: id
    hidden: yes
    sql: ${TABLE}.uid ;;
    description: "Unique ID that identifies the discount only within this order."
  }
}
