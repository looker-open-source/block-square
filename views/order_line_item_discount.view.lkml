view: order_line_item_discount {
  sql_table_name: Square.ORDER_LINE_ITEM_DISCOUNT ;;

  dimension: pk {
    hidden: yes
    primary_key: yes
    sql: CONCAT(${uid}, ${order_id}) ;;
  }

  dimension: amount_money {
    label: "Discount Amount Money"
    type: number
    sql: ${TABLE}.amount_money ;;
  }

  dimension: applied_money {
    label: "Discount Applied Money"
    type: number
    sql: ${TABLE}.applied_money ;;
  }

  dimension: catalog_object_id {
    type: number
    hidden: yes
    sql: ${TABLE}.catalog_object_id ;;
  }

  dimension: name {
    label: "Discount Name"
    type: string
    sql: ${TABLE}.name ;;
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
  }

  dimension: scope {
    label: "Discount Scope"
    type: string
    sql: ${TABLE}.scope ;;
  }

  dimension: type {
    label: "Discount Type"
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: uid {
    type: number
    value_format_name: id
    hidden: yes
    sql: ${TABLE}.uid ;;
  }

}
