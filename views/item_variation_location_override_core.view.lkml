include: "//@{CONFIG_PROJECT_NAME}/*/item_variation_location_override.view.lkml"

view: item_variation_location_override {
  extends: [item_variation_location_override_config]
}

view: item_variation_location_override_core {
  sql_table_name: @{SCHEMA_NAME}.ITEM_VARIATION_LOCATION_OVERRIDE ;;

  dimension: pk {
    hidden: yes
    primary_key: yes
    sql: CONCAT(CAST(${item_id} AS STRING), CAST(${location_id} AS STRING), CAST(${item_name} AS STRING)) ;;
  }

  dimension: inventory_alert_threshold {
    label: "Location Variant Override Alert Threshold"
    type: number
    sql: ${TABLE}.inventory_alert_threshold ;;
    description: "If the inventory quantity for the variation is less than or equal to this value and inventory_alert_type is LOW_QUANTITY, the variation displays an alert in the merchant dashboard."
  }

  dimension: inventory_alert_type {
    label: "Location Variant Override Alert Type"
    type: string
    sql: ${TABLE}.Inventory_alert_type ;;
    description: "Indicates whether the item variation displays an alert when its inventory quantity is less than or equal to its inventory_alert_threshold."
  }

  dimension: item_id {
    type: number
    hidden: yes
    sql: ${TABLE}.item_id ;;
    description: "The ID of the CatalogItem associated with this item variation. Searchable."
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
    description: "The item variation's price, if fixed pricing is used."
  }

  dimension: pricing_type {
    label: "Location Variant Override Pricing Type"
    type: string
    sql: ${TABLE}.pricing_type ;;
    description: "Indicates whether the item variation's price is fixed or determined at the time of sale."
  }

  dimension: track_inventory {
    label: "Location Variant Override Track Inventory?"
    type: yesno
    sql: ${TABLE}.Track_inventory ;;
    description: "If true, inventory tracking is active for the variation."
  }
}