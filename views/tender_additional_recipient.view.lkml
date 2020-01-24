view: tender_additional_recipient {
  sql_table_name: Square.TENDER_ADDITIONAL_RECIPIENT ;;

  dimension: pk {
    hidden: yes
    primary_key: yes
    sql: CONCAT(CAST(${receivable_id} AS STRING), CAST(${tender_id} AS STRING)) ;;
  }

  dimension: amount_money {
    label: "Additional Recipient Amount"
    type: number
    sql: ${TABLE}.amount_money ;;
  }

  dimension: description {
    label: "Additional Recipient Description"
    type: string
    sql: ${TABLE}.description ;;
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

  dimension: tender_id {
    type: number
    hidden: yes
    sql: ${TABLE}.tender_id ;;
  }

}
