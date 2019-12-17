view: additional_recipient_refund {
  sql_table_name: Square.ADDITIONAL_RECIPIENT_REFUND ;;

  dimension: pk {
    hidden: yes
    primary_key: yes
    sql: CONCAT(${refund_id}, ${index}) ;;
  }

  dimension: amount_money {
    label: "Additional Recipient Refund Amount"
    type: number
    sql: ${TABLE}.amount_money ;;
  }

  dimension: description {
    label: "Additional Recipient Refund Description"
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: index {
    label: "Additional Recipient Refund Index"
    type: number
    sql: ${TABLE}.index ;;
  }

  dimension: location_id {
    type: number
    hidden: yes
    sql: ${TABLE}.location_id ;;
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

}
