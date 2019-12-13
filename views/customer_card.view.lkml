view: customer_card {
  sql_table_name: Square.CUSTOMER_CARD ;;

  dimension: card_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.card_id ;;
  }

  dimension: customer_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.customer_id ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
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
