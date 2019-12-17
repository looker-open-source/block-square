view: item_variation_location_override {
  sql_table_name: Square.ITEM_VARIATION_LOCATION_OVERRIDE ;;

  dimension: pk {
    hidden: yes
    primary_key: yes
    sql: CONCAT(${item_id}, ${location_id}, ${item_name}) ;;
  }

  dimension: inventory_alert_threshold {
    label: "Location Variant Override Alert Threshold"
    type: number
    sql: ${TABLE}.inventory_alert_threshold ;;
  }

  dimension: inventory_alert_type {
    label: "Location Variant Override Alert Type"
    type: string
    sql: ${TABLE}.Inventory_alert_type ;;
  }

  dimension: item_id {
    type: number
    hidden: yes
    sql: ${TABLE}.item_id ;;
  }

  dimension: item_name {
    label: "Location Variant Override Name"
    type: string
    sql: ${TABLE}.item_name ;;
  }

  dimension: location_id {
    label: "Location Variant Override Location ID"
    type: number
    sql: ${TABLE}.location_id ;;
  }

  dimension: price_money {
    label: "Location Variant Override Price"
    type: number
    sql: ${TABLE}.price_money ;;
  }

  dimension: pricing_type {
    label: "Location Variant Override Pricing Type"
    type: string
    sql: ${TABLE}.pricing_type ;;
  }

  dimension: track_inventory {
    label: "Location Variant Override Track Inventory?"
    type: yesno
    sql: ${TABLE}.Track_inventory ;;
  }

}
