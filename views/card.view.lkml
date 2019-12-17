view: card {
  sql_table_name: Square.CARD ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    hidden: yes
    sql: ${TABLE}.id ;;
  }

  dimension: billing_address {
    label: "Card Billing Address"
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
    label: "Card Exp Month"
    type: string
    sql: ${TABLE}.exp_month ;;
  }

  dimension: exp_year {
    label: "Card Exp Year"
    type: number
    sql: ${TABLE}.exp_year ;;
  }

  dimension: fingerprint {
    label: "Card Fingerprint"
    type: string
    sql: ${TABLE}.fingerprint ;;
  }

  dimension: last_4 {
    label: "Card Last 4"
    type: number
    sql: ${TABLE}.last_4 ;;
  }

}
