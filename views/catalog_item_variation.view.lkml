view: catalog_item_variation {
  sql_table_name: Square.CATALOG_ITEM_VARIATION ;;

  dimension: pk {
    hidden: yes
    primary_key: yes
    sql: CONCAT(CAST(${item_id} AS STRING), CAST(${name} AS STRING)) ;;
  }

  dimension: inventory_alert_threshold {
    label: "Variant Inventory Alert Threshold"
    type: string
    sql: ${TABLE}.inventory_alert_threshold ;;
  }

  dimension: inventory_alert_type {
    label: "Variant Inventory Alert Type"
    type: string
    sql: ${TABLE}.inventory_alert_type ;;
  }

  dimension: item_id {
    type: number
    hidden: yes
    sql: ${TABLE}.item_id ;;
  }

  dimension: name {
    label: "Variant Name"
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: ordinal {
    label: "Variant Ordinal"
    type: number
    sql: ${TABLE}.ordinal ;;
  }

  dimension: price_money {
    label: "Variant Price"
    type: number
    sql: ${TABLE}.price_money ;;
  }

  dimension: pricing_type {
    label: "Variant Pricing Type"
    type: string
    sql: ${TABLE}.pricing_type ;;
  }

  dimension: service_duration {
    label: "Variant Service Duration"
    type: number
    sql: ${TABLE}.service_duration ;;
  }

  dimension: sku {
    label: "Variant SKU"
    type: number
    sql: ${TABLE}.sku ;;
  }

  dimension: track_inventory {
    label: "Variant Track Inventory"
    type: number
    sql: ${TABLE}.track_inventory ;;
  }

  dimension: upc {
    label: "Variant UPC"
    type: number
    sql: ${TABLE}.upc ;;
  }

  dimension: user_data {
    label: "Variant User Data"
    type: string
    sql: ${TABLE}.user_data ;;
  }

  measure: count {
    label: "Variant Count"
    type: count
    drill_fields: [name]
  }
}
