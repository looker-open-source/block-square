include: "//@{CONFIG_PROJECT_NAME}/*/refund.view.lkml"

view: refund {
  extends: [refund_config]
}

view: refund_core {
  sql_table_name: Square.REFUND ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.id ;;
    description: "The refund's unique ID."
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
    description: "The amount of money refunded to the buyer."
  }

  dimension: location_id {
    label: "Refund Location ID"
    type: number
    sql: ${TABLE}.location_id ;;
    description: "The ID of the refund's associated location."
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
    description: "The amount of Square processing fee money refunded to the merchant."
  }

  dimension: reason {
    label: "Refund Reason"
    type: string
    sql: ${TABLE}.reason ;;
    description: "The reason for the refund being issued."
  }

  dimension: status {
    label: "Refund Status"
    type: yesno
    sql: ${TABLE}.status ;;
    description: "The current status of the refund (PENDING, APPROVED, REJECTED, or FAILED)."
  }

  dimension: tender_id {
    type: number
    hidden: yes
    sql: ${TABLE}.tender_id ;;
    description: "The ID of the refunded tender."
  }

  dimension: transaction_id {
    type: number
    hidden: yes
    sql: ${TABLE}.transaction_id ;;
    description: "The ID of the transaction that the refunded tender is part of."
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
    description: "The time when the refund was created, in RFC 3339 format."
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