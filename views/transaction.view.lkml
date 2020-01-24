view: transaction {
  sql_table_name: Square.TRANSACTION ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    hidden: yes
    sql: ${TABLE}.id ;;
    description: "The transaction's unique ID, issued by Square payments servers."
  }

  dimension: client_id {
    hidden: yes
    type: number
    sql: ${TABLE}.client_id ;;
    description: "If the transaction was created in the Square Point of Sale app, this value is the ID generated for the transaction by Square Point of Sale."
  }

  dimension: location_id {
    hidden: yes
    type: number
    sql: ${TABLE}.location_id ;;
    description: "The ID of the transaction's associated location."
  }

  dimension: order_id {
    type: number
    hidden: yes
    sql: ${TABLE}.order_id ;;
    description: "The order_id is an identifier for the order associated with this transaction, if any."
  }

  dimension: product {
    label: "Transaction Product"
    type: string
    sql: ${TABLE}.product ;;
    description: "The Square product that processed the transaction."
  }

  dimension: reference_id {
    type: number
    hidden: yes
    sql: ${TABLE}.reference_id ;;
    description: "If the transaction was created with the Charge endpoint, this value is the same as the value provided for the reference_id parameter in the request to that endpoint. Otherwise, it is not set."
  }

  dimension: refunds {
    label: "Transaction Refunds"
    type: string
    sql: ${TABLE}.refunds ;;
    description: "Refunds that have been applied to any tender in the transaction."
  }

  dimension: shipping_address {
    label: "Transaction Shipping Address"
    type: string
    sql: ${TABLE}.shipping_address ;;
    description: "The shipping address provided in the request, if any."
  }

  dimension: tenders {
    label: "Transaction Tenders"
    type: string
    sql: ${TABLE}.tenders ;;
    description: "The tenders used to pay in the transaction."
  }

  dimension_group: created {
    label: "Transaction Created At"
    type: time
    timeframes: [
      raw,
      time_of_day,
      hour_of_day,
      day_of_week,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.created_at ;;
    description: "The time when the transaction was created, in RFC 3339 format."
  }

  measure: count {
    label: "Transaction Count"
    type: count
    drill_fields: [detail*]
  }

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
