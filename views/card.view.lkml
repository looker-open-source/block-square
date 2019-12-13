view: card {
  sql_table_name: Square.CARD ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: billing_address {
    type: string
    sql: ${TABLE}.billing_address ;;
  }

  dimension: card_brand {
    type: string
    sql: ${TABLE}.card_brand ;;
  }

  dimension: cardholder_name {
    type: string
    sql: ${TABLE}.cardholder_name ;;
  }

  dimension: exp_month {
    type: string
    sql: ${TABLE}.exp_month ;;
  }

  dimension: exp_year {
    type: number
    sql: ${TABLE}.exp_year ;;
  }

  dimension: fingerprint {
    type: string
    sql: ${TABLE}.fingerprint ;;
  }

  dimension: last_4 {
    type: number
    sql: ${TABLE}.last_4 ;;
  }

  measure: count {
    type: count
    drill_fields: [id, cardholder_name, customer_card.count]
  }
}
