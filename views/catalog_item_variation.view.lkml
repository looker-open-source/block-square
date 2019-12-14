view: catalog_item_variation {
  sql_table_name: Square.CATALOG_ITEM_VARIATION ;;

  dimension: inventory_alert_threshold {
    type: string
    sql: ${TABLE}.inventory_alert_threshold ;;
  }

  dimension: inventory_alert_type {
    type: string
    sql: ${TABLE}.inventory_alert_type ;;
  }

  dimension: item_id {
    type: number
    sql: ${TABLE}.item_id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: ordinal {
    type: number
    sql: ${TABLE}.ordinal ;;
  }

  dimension: price_money {
    type: number
    sql: ${TABLE}.price_money ;;
  }

  dimension: pricing_type {
    type: string
    sql: ${TABLE}.pricing_type ;;
  }

  dimension: service_duration {
    type: number
    sql: ${TABLE}.service_duration ;;
  }

  dimension: sku {
    type: number
    sql: ${TABLE}.sku ;;
  }

  dimension: track_inventory {
    type: number
    sql: ${TABLE}.track_inventory ;;
  }

  dimension: upc {
    type: number
    sql: ${TABLE}.upc ;;
  }

  dimension: user_data {
    type: string
    sql: ${TABLE}.user_data ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
