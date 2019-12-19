view: order_line_item_tax {
  sql_table_name: Square.ORDER_LINE_ITEM_TAX ;;

  dimension: pk {
    hidden: yes
    primary_key: yes
    sql: CONCAT(CAST(${uid} AS STRING), CAST(${order_id} AS STRING)) ;;
  }

  dimension: applied_money {
    label: "Tax Applied Money"
    type: number
    sql: ${TABLE}.applied_money ;;
  }

  dimension: catalog_object_id {
    type: number
    hidden: yes
    sql: ${TABLE}.catalog_object_id ;;
  }

  dimension: name {
    label: "Tax Name"
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: order_id {
    type: number
    hidden: yes
    sql: ${TABLE}.order_id ;;
  }

  dimension: percentage {
    label: "Tax Percentage"
    type: number
    sql: ${TABLE}.percentage ;;
  }

  dimension: scope {
    label: "Tax Scope"
    type: string
    sql: ${TABLE}.scope ;;
  }

  dimension: type {
    label: "Tax Type"
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: uid {
    type: number
    hidden: yes
    value_format_name: id
    sql: ${TABLE}.uid ;;
  }

}
