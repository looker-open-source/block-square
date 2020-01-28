include: "//@{CONFIG_PROJECT_NAME}/*/order_return.view.lkml"

view: order_return {
  extends: [order_return_config]
}

view: order_return_core {
  sql_table_name: @{SCHEMA_NAME}.ORDER_RETURN ;;

  dimension: pk {
    hidden: yes
    primary_key: yes
    sql: CONCAT(CAST(${uid} AS STRING), CAST(${source_order_id} AS STRING)) ;;
  }

  dimension: source_order_id {
    type: number
    sql: ${TABLE}.source_order_id ;;
    description: "Order which contains the original sale of these returned line items. This will be unset for unlinked returns."
  }

  dimension: uid {
    type: number
    value_format_name: id
    hidden: yes
    sql: ${TABLE}.uid ;;
    description: "Unique ID that identifies the return only within this order."
  }

  measure: count {
    label: "Return Count"
    type: count
    drill_fields: []
  }
}