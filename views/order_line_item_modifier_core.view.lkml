include: "//@{CONFIG_PROJECT_NAME}/*/order_line_item_modifier.view.lkml"

view: order_line_item_modifier {
  extends: [order_line_item_modifier_config]
}

view: order_line_item_modifier_core {
  sql_table_name: Square.ORDER_LINE_ITEM_MODIFIER ;;

  dimension: pk {
    hidden: yes
    primary_key: yes
    sql: CONCAT(CAST(${uid} AS STRING), CAST(${order_line_item_id} AS STRING)) ;;
  }

  dimension: base_price_money {
    label: "Modifier Base Price Money"
    type: number
    sql: ${TABLE}.base_price_money ;;
    description: "The base price for the modifier."
  }

  dimension: catalog_object_id {
    type: number
    hidden: yes
    sql: ${TABLE}.catalog_object_id ;;
    description: "The catalog object id referencing CatalogModifier."
  }

  dimension: name {
    label: "Modifier Name"
    type: string
    sql: ${TABLE}.name ;;
    description: "The name of the item modifier."
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
    description: "Read only The total price of the item modifier for its line item. This is the modifier's base_price_money multiplied by the line item's quantity."
  }

  dimension: uid {
    type: number
    value_format_name: id
    hidden: yes
    sql: ${TABLE}.uid ;;
    description: "Unique ID that identifies the modifier only within this order."
  }

  measure: count {
    label: "Modifier Count"
    type: count
    drill_fields: [name, catalog_object.id]
  }
}