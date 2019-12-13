view: tender_additional_recipient {
  sql_table_name: Square.TENDER_ADDITIONAL_RECIPIENT ;;

  dimension: amount_money {
    type: number
    sql: ${TABLE}.amount_money ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: location_id {
    type: number
    sql: ${TABLE}.location_id ;;
  }

  dimension: receivable_id {
    type: number
    sql: ${TABLE}.receivable_id ;;
  }

  dimension: tender_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.tender_id ;;
  }

  measure: count {
    type: count
    drill_fields: [tender.id]
  }
}
