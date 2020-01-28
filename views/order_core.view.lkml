include: "//@{CONFIG_PROJECT_NAME}/*/order.view.lkml"

view: order {
  extends: [order_config]
}

view: order_core {
  sql_table_name: Square.`ORDER` ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    description: "Read only The order's unique ID."
  }

  dimension: location_id {
    type: number
    sql: ${TABLE}.location_id ;;
    description: "The ID of the merchant location this order is associated with."
  }

  dimension: net_amount {
    type: number
    sql: ${TABLE}.net_amount ;;
    description: "Net money amounts (sale money - return money)."
  }

  dimension: order_source_name {
    type: string
    sql: ${TABLE}.order_source_name ;;
  }

  dimension: reference_id {
    type: number
    sql: ${TABLE}.reference_id ;;
    description: "A client specified identifier to associate an entity in another system with this order."
  }

  dimension: return_amount {
    type: number
    sql: ${TABLE}.return_amount ;;
    description: "Rollup of returned money amounts."
  }

  dimension: rounding_adjustment {
    type: number
    sql: ${TABLE}.rounding_adjustment ;;
    description: "Read only A positive or negative rounding adjustment to the total of the order, commonly used to apply Cash Rounding when the minimum unit of account is smaller than the lowest physical denomination of currency."
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
    description: "The current state of the order. OPEN,COMPLETED,CANCELED"
  }

  dimension: total_discount_money {
    label: "Order Total Discount"
    type: number
    sql: ${TABLE}.total_discount_money ;;
    description: "Read only The total discount amount of money to collect for the order."
  }

  dimension: total_money {
    label: "Order Total Money"
    type: number
    sql: ${TABLE}.total_money ;;
    description: "Read only The total amount of money to collect for the order."
  }

  dimension: total_service_charge_money {
    label: "Order Total Service Charge"
    type: number
    sql: ${TABLE}.total_service_charge_money ;;
    description: "Read only The total amount of money collected in service charges for the order."
  }

  dimension: total_tax_money {
    label: "Order Total Tax"
    type: number
    sql: ${TABLE}.total_tax_money ;;
    description: "Read only The total tax amount of money to collect for the order."
  }

  dimension_group: closed {
    type: time
    timeframes: [
      raw,
      time_of_day,
      hour_of_day,
      day_of_week,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.closed_at ;;
    description: "Timestamp for when the order was closed. In RFC 3339 format."
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time_of_day,
      date,
      week,
      month,
      day_of_week,
      hour_of_day,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.created_at ;;
    description: "Timestamp for when the order was created. In RFC 3339 format."
  }

  dimension_group: updated {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.updated_at ;;
    description: "Timestamp for when the order was last updated. In RFC 3339 format."

  }

  measure: avg_open {
    label: "Average Order Open Duration"
    type: average
    sql: DATE_DIFF(${created_raw}, ${closed_raw}, DAY) ;;

    filters: {
      field: state
      value: "COMPLETED"
    }
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: revenue {
    type: sum
    sql: ${total_money} ;;
    drill_fields: [detail*]
    value_format_name: decimal_2
  }

  measure: total_discount {
    type: sum
    sql: ${total_discount_money} ;;
    drill_fields: [detail*]
    value_format_name: decimal_2
  }

  measure: total_service_charge {
    type: sum
    sql: ${total_service_charge_money} ;;
    drill_fields: [detail*]
    value_format_name: decimal_2
  }

  measure: total_tax {
    type: sum
    sql: ${total_tax_money} ;;
    drill_fields: [detail*]
    value_format_name: decimal_2
  }

  measure: net_sales {
    type: number
    sql: ${revenue} - (${order_return_line_item.total_return_amount} + ${total_discount}) ;;
    description: "Orders Revenue less Returns, Discounts and Comps"
    drill_fields: [detail*]
    value_format_name: decimal_2
  }

  measure: total_sales {
    type: number
    sql: (${net_sales} + ${tender.total_tips}) - ${total_tax} ;;
    description: "Net Sales & Tips less Taxes"
    drill_fields: [detail*]
    value_format_name: decimal_2
  }

  set: detail {
    fields: [
      id,
      order_source_name,
      transaction.count,
      order.total_money,
      order_service_charge.count,
      tender.count,
      order_line_item_tax.count,
      order_line_item.count,
      refund.count,
      order_fulfillment.count
    ]
  }
}