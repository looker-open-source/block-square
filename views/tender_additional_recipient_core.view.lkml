include: "//@{CONFIG_PROJECT_NAME}/tender_additional_recipient.view.lkml"

view: tender_additional_recipient {
  extends: [tender_additional_recipient_config]
}

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
    description: "The amount of money distributed to the recipient."
  }

  dimension: description {
    label: "Additional Recipient Description"
    type: string
    sql: ${TABLE}.description ;;
    description: "The description of the additional recipient."
  }

  dimension: location_id {
    type: number
    hidden: yes
    sql: ${TABLE}.location_id ;;
    description: "The location ID for a recipient (other than the merchant) receiving a portion of this tender."
  }

  dimension: receivable_id {
    type: number
    hidden: yes
    sql: ${TABLE}.receivable_id ;;
    description: "The unique ID for this AdditionalRecipientReceivable, assigned by the server."
  }

  dimension: tender_id {
    type: number
    hidden: yes
    sql: ${TABLE}.tender_id ;;
  }
}
