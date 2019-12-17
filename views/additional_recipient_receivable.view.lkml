view: additional_recipient_receivable {
  sql_table_name: Square.ADDITIONAL_RECIPIENT_RECEIVABLE ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: amount_money {
    label: "Additional Receivable Amount"
    type: number
    sql: ${TABLE}.amount_money ;;
  }

  dimension_group: created {
    label: "Additional Receivable Created At"
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

  dimension: transaction_id {
    type: number
    hidden: yes
    sql: ${TABLE}.transaction_id ;;
  }

  dimension: transaction_location_id {
    type: number
    hidden: yes
    sql: ${TABLE}.transaction_location_id ;;
  }

}
