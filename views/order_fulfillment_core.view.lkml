include: "//@{CONFIG_PROJECT_NAME}/*/order_fulfillment.view.lkml"

view: order_fulfillment {
  extends: [order_fulfillment_config]
}

view: order_fulfillment_core {
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
    description: "Contains details for a pickup fulfillment. Required when fulfillment type is PICKUP."
  }

  dimension: state {
    label: "Fulfillment State"
    type: string
    sql: ${TABLE}.state ;;
    description: "The state of the fulfillment."
  }

  dimension: type {
    label: "Fulfillment Type"
    type: string
    sql: ${TABLE}.type ;;
    description: "The type of the fulfillment."
  }

  dimension: uid {
    type: number
    hidden: yes
    value_format_name: id
    sql: ${TABLE}.uid ;;
    description: "Unique ID that identifies the fulfillment only within this order."
  }

  measure: fulfillment_count {
    type: count
    drill_fields: [catalog_object.id, order.order_source_name, order.id]
  }
}