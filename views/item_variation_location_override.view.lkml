view: item_variation_location_override {
  sql_table_name: Square.ITEM_VARIATION_LOCATION_OVERRIDE ;;

  dimension: inventory_alert_threshold {
    type: number
    sql: ${TABLE}.inventory_alert_threshold ;;
  }

  dimension: inventory_alert_type {
    type: string
    sql: ${TABLE}.Inventory_alert_type ;;
  }

  dimension: item_id {
    type: number
    sql: ${TABLE}.item_id ;;
  }

  dimension: item_name {
    type: string
    sql: ${TABLE}.item_name ;;
  }

  dimension: location_id {
    type: number
    sql: ${TABLE}.location_id ;;
  }

  dimension: price_money {
    type: number
    sql: ${TABLE}.price_money ;;
  }

  dimension: pricing_type {
    type: string
    sql: ${TABLE}.pricing_type ;;
  }

  dimension: track_inventory {
    type: yesno
    sql: ${TABLE}.Track_inventory ;;
  }

  measure: count {
    type: count
    drill_fields: [item_name]
  }
}
