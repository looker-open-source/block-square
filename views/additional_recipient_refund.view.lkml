view: additional_recipient_refund {
  sql_table_name: Square.ADDITIONAL_RECIPIENT_REFUND ;;

  dimension: amount_money {
    type: number
    sql: ${TABLE}.amount_money ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: index {
    type: number
    sql: ${TABLE}.index ;;
  }

  dimension: location_id {
    type: number
    sql: ${TABLE}.location_id ;;
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

  measure: count {
    type: count
    drill_fields: [refund.id]
  }
}
