include: "//@{CONFIG_PROJECT_NAME}/*/additional_recipient_receivable.view.lkml"

view: additional_recipient_receivable {
  extends: [additional_recipient_receivable_config]
}

view: additional_recipient_receivable_core {
  sql_table_name: Square.ADDITIONAL_RECIPIENT_RECEIVABLE ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    hidden: yes
    type: number
    description: "The additional recipient receivable's unique ID, issued by Square payments servers."
    sql: ${TABLE}.id ;;
  }

  dimension: amount_money {
    label: "Additional Receivable Amount"
    description: "The amount of the receivable. This will always be non-negative."
    type: number
    sql: ${TABLE}.amount_money ;;
  }

  dimension: transaction_id {
    description: "The ID of the transaction that the additional recipient receivable was applied to."
    type: number
    hidden: yes
    sql: ${TABLE}.transaction_id ;;
  }

  dimension: transaction_location_id {
    description: "The ID of the location that created the receivable. This is the location ID on the associated transaction."
    type: number
    hidden: yes
    sql: ${TABLE}.transaction_location_id ;;
  }

  dimension_group: created {
    label: "Additional Receivable Created At"
    description: "The time when the additional recipient receivable was created, in RFC 3339 format."
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
}