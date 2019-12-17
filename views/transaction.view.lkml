view: transaction {
  sql_table_name: Square.TRANSACTION ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    hidden: yes
    sql: ${TABLE}.id ;;
  }

  dimension: client_id {
    hidden: yes
    type: number
    sql: ${TABLE}.client_id ;;
  }

  dimension_group: created {
    label: "Transaction Created At"
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

  dimension: location_id {
    hidden: yes
    type: number
    sql: ${TABLE}.location_id ;;
  }

  dimension: order_id {
    type: number
    hidden: yes
    sql: ${TABLE}.order_id ;;
  }

  dimension: product {
    label: "Transaction Product"
    type: string
    sql: ${TABLE}.product ;;
  }

  dimension: reference_id {
    type: number
    hidden: yes
    sql: ${TABLE}.reference_id ;;
  }

  dimension: refunds {
    label: "Transaction Refunds"
    type: string
    sql: ${TABLE}.refunds ;;
  }

  dimension: shipping_address {
    label: "Transaction Shipping Address"
    type: string
    sql: ${TABLE}.shipping_address ;;
  }

  dimension: tenders {
    label: "Transaction Tenders"
    type: string
    sql: ${TABLE}.tenders ;;
  }

  measure: count {
    label: "Transaction Count"
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      order.order_source_name,
      order.id,
      tender.count,
      refund.count,
      additional_recipient_receivable.count
    ]
  }
}
