view: additional_recipient_receivable_refund {
  sql_table_name: Square.ADDITIONAL_RECIPIENT_RECEIVABLE_REFUND ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    hidden: yes
    sql: ${TABLE}.id ;;
  }

  dimension: amount_money {
    label: "Additional Receivable Refund Amount"
    type: number
    sql: ${TABLE}.amount_money ;;
  }

  dimension_group: created {
    label: "Additional Receivable Refund Created At"
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

  dimension: receivable_id {
    type: number
    hidden: yes
    sql: ${TABLE}.receivable_id ;;
  }

  dimension: refund_id {
    type: number
    hidden: yes
    sql: ${TABLE}.refund_id ;;
  }

  dimension: transaction_location_id {
    label: "Additional Receivable Refund Location ID"
    type: number
    sql: ${TABLE}.transaction_location_id ;;
  }
}
