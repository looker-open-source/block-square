include: "//@{CONFIG_PROJECT_NAME}/*/customer_card.view.lkml"

view: customer_card {
  extends: [customer_card_config]
}

view: customer_card_core {
  sql_table_name: Square.CUSTOMER_CARD ;;

  dimension: pk {
    hidden: yes
    primary_key: yes
    sql: CONCAT(CAST(${card_id} AS STRING), CAST(${customer_id} AS STRING)) ;;
  }

  dimension: card_id {
    type: number
    sql: ${TABLE}.card_id ;;
  }

  dimension: customer_id {
    type: number
    sql: ${TABLE}.customer_id ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      customer.given_name,
      customer.company_name,
      customer.nickname,
      customer.id,
      customer.family_name,
      card.id,
      card.cardholder_name
    ]
  }
}