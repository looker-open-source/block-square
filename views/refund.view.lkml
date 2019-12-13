view: refund {
  sql_table_name: Square.REFUND ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: amount_currency {
    type: number
    sql: ${TABLE}.amount_currency ;;
  }

  dimension: amount_money {
    type: number
    sql: ${TABLE}.amount_money ;;
  }

  dimension_group: created {
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
    sql: ${TABLE}.created_at ;;
  }

  dimension: location_id {
    type: number
    sql: ${TABLE}.location_id ;;
  }

  dimension: order_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.order_id ;;
  }

  dimension: processing_fee_money {
    type: number
    sql: ${TABLE}.processing_fee_money ;;
  }

  dimension: reason {
    type: string
    sql: ${TABLE}.reason ;;
  }

  dimension: status {
    type: yesno
    sql: ${TABLE}.status ;;
  }

  dimension: tender_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.tender_id ;;
  }

  dimension: transaction_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.transaction_id ;;
  }

  measure: count {
    type: count
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
