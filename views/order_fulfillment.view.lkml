view: order_fulfillment {
  sql_table_name: Square.ORDER_FULFILLMENT ;;

  dimension: pk {
    hidden: yes
    primary_key: yes
    sql: CONCAT(CAST(${uid} AS STRING), CAST(${order_id} AS STRING)) ;;
  }

  dimension: catalog_object_id {
    type: number
    hidden: yes
    sql: ${TABLE}.catalog_object_id ;;
  }

  dimension: order_id {
    type: number
    hidden: yes
    sql: ${TABLE}.order_id ;;
  }

  dimension: pickup_details {
    label: "Fulfillment Pickup Details"
    type: string
    sql: ${TABLE}.pickup_details ;;
  }

  dimension: state {
    label: "Fulfillment State"
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: type {
    label: "Fulfillment Type"
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: uid {
    type: number
    hidden: yes
    value_format_name: id
    sql: ${TABLE}.uid ;;
  }

  measure: fulfillment_count {
    type: count
    drill_fields: [catalog_object.id, order.order_source_name, order.id]
  }
}
