view: order_return_line_item_modifier {
  sql_table_name: Square.ORDER_RETURN_LINE_ITEM_MODIFIER ;;

  dimension: pk {
    hidden: yes
    primary_key: yes
    sql: CONCAT(CAST(${uid} AS STRING), CAST(${order_return_line_item_id} AS STRING)) ;;
  }

  dimension: base_price_money {
    label: "Return Modifier Base Price"
    type: number
    sql: ${TABLE}.base_price_money ;;
  }

  dimension: catalog_object_id {
    type: number
    hidden: yes
    sql: ${TABLE}.catalog_object_id ;;
  }

  dimension: name {
    label: "Return Modifier Name"
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: order_return_line_item_id {
    type: number
    hidden: yes
    sql: ${TABLE}.order_return_line_item_id ;;
  }

  dimension: source_modifier_uid {
    type: number
    hidden: yes
    value_format_name: id
    sql: ${TABLE}.source_modifier_uid ;;
  }

  dimension: total_price_money {
    label: "Return Modifier Total Price"
    type: number
    sql: ${TABLE}.total_price_money ;;
  }

  dimension: uid {
    hidden: yes
    type: number
    value_format_name: id
    sql: ${TABLE}.uid ;;
  }

  measure: count {
    label: "Return Modifier Count"
    type: count
    drill_fields: [name, catalog_object.id]
  }
}
