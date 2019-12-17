view: order_line_item_modifier {
  sql_table_name: Square.ORDER_LINE_ITEM_MODIFIER ;;

  dimension: pk {
    hidden: yes
    primary_key: yes
    sql: CONCAT(${uid}, ${order_line_item_id}) ;;
  }

  dimension: base_price_money {
    label: "Modifier Base Price Money"
    type: number
    sql: ${TABLE}.base_price_money ;;
  }

  dimension: catalog_object_id {
    type: number
    hidden: yes
    sql: ${TABLE}.catalog_object_id ;;
  }

  dimension: name {
    label: "Modifier Name"
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: order_line_item_id {
    hidden: yes
    type: number
    sql: ${TABLE}.order_line_item_id ;;
  }

  dimension: total_price_money {
    label: "Modifier Total Price"
    type: number
    sql: ${TABLE}.total_price_money ;;
  }

  dimension: uid {
    type: number
    value_format_name: id
    hidden: yes
    sql: ${TABLE}.uid ;;
  }

  measure: count {
    label: "Modifier Count"
    type: count
    drill_fields: [name, catalog_object.id]
  }
}
