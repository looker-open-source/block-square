include: "//@{CONFIG_PROJECT_NAME}/*/additional_recipient_refund.view.lkml"

view: additional_recipient_refund {
  extends: [additional_recipient_refund_config]
}

view: additional_recipient_refund_core {
  sql_table_name: Square.ADDITIONAL_RECIPIENT_REFUND ;;

  dimension: pk {
    hidden: yes
    primary_key: yes
    sql: CONCAT(CAST(${refund_id} AS STRING), CAST(${index} AS STRING)) ;;
  }

  dimension: amount_money {
    label: "Additional Recipient Refund Amount"
    type: number
    sql: ${TABLE}.amount_money ;;
    description: "The amount of the refund. This will always be non-negative."
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
    description: "The ID of the receivable that the refund was applied to."
  }

  dimension: refund_id {
    type: number
    hidden: yes
    sql: ${TABLE}.refund_id ;;
    description: "The ID of the refund that is associated to this receivable refund."
  }
}