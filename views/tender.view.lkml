view: tender {
  sql_table_name: Square.TENDER ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: amount_money {
    type: number
    sql: ${TABLE}.amount_money ;;
  }

  dimension: card_details_card_brand {
    type: string
    sql: ${TABLE}.card_details_card_brand ;;
  }

  dimension: card_details_entry_method {
    type: string
    sql: ${TABLE}.card_details_entry_method ;;
  }

  dimension: card_details_fingerprint {
    type: string
    sql: ${TABLE}.card_details_fingerprint ;;
  }

  dimension: card_details_last_4 {
    type: number
    sql: ${TABLE}.card_details_last_4 ;;
  }

  dimension: card_details_status {
    type: string
    sql: ${TABLE}.card_details_status ;;
  }

  dimension: cash_details_buyer_tendered_money {
    type: number
    sql: ${TABLE}.cash_details_buyer_tendered_money ;;
  }

  dimension: cash_details_change_back_money {
    type: number
    sql: ${TABLE}.cash_details_change_back_money ;;
  }

  dimension_group: created {
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

  dimension: customer_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.customer_id ;;
  }

  dimension: location_id {
    type: number
    sql: ${TABLE}.location_id ;;
  }

  dimension: note {
    type: string
    sql: ${TABLE}.note ;;
  }

  dimension: order_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.order_id ;;
  }

  dimension: processing_fee_money {
    type: number
    sql: ${TABLE}.processing_fee_money ;;
  }

  dimension: tip_money {
    type: number
    sql: ${TABLE}.tip_money ;;
  }

  dimension: transaction_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.transaction_id ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      transaction.id,
      customer.given_name,
      customer.company_name,
      customer.nickname,
      customer.id,
      customer.family_name,
      order.order_source_name,
      order.id,
      refund.count,
      tender_additional_recipient.count
    ]
  }
}
