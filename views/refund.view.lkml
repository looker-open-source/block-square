view: refund {
  sql_table_name: Square.REFUND ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: amount_currency {
    label: "Refund Amount Currency"
    type: number
    sql: ${TABLE}.amount_currency ;;
  }

  dimension: amount_money {
    label: "Refund Amount"
    type: number
    sql: ${TABLE}.amount_money ;;
  }

  dimension_group: created {
    label: "Refund Created At"
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
    sql: ${TABLE}.created_at ;;
  }

  dimension: location_id {
    label: "Refund Location ID"
    type: number
    sql: ${TABLE}.location_id ;;
  }

  dimension: order_id {
    type: number
    hidden: yes
    sql: ${TABLE}.order_id ;;
  }

  dimension: processing_fee_money {
    label: "Refund Processing Fee"
    type: number
    sql: ${TABLE}.processing_fee_money ;;
  }

  dimension: reason {
    label: "Refund Reason"
    type: string
    sql: ${TABLE}.reason ;;
  }

  dimension: status {
    label: "Refund Status"
    type: yesno
    sql: ${TABLE}.status ;;
  }

  dimension: tender_id {
    type: number
    hidden: yes
    sql: ${TABLE}.tender_id ;;
  }

  dimension: transaction_id {
    type: number
    hidden: yes
    sql: ${TABLE}.transaction_id ;;
  }

  measure: count {
    label: "Refund Count"
    type: count
    drill_fields: [detail*]
  }

  measure: refunded_amount {
    label: "Refund Total"
    type: sum
    sql: ${amount_money} ;;
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      transaction.id,
      tender.id,
      order.order_source_name,
      order.id,
      additional_recipient_refund.count,
      additional_recipient_receivable_refund.count
    ]
  }
}
