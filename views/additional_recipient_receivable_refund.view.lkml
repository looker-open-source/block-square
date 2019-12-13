view: additional_recipient_receivable_refund {
  sql_table_name: Square.ADDITIONAL_RECIPIENT_RECEIVABLE_REFUND ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
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

  dimension: receivable_id {
    type: number
    sql: ${TABLE}.receivable_id ;;
  }

  dimension: refund_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.refund_id ;;
  }

  dimension: transaction_location_id {
    type: number
    sql: ${TABLE}.transaction_location_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id, refund.id]
  }
}
