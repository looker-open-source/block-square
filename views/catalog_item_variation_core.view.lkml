include: "//@{CONFIG_PROJECT_NAME}/*/catalog_item_variation.view.lkml"

view: catalog_item_variation {
  extends: [catalog_item_variation_config]
}

view: catalog_item_variation_core {
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
    description: "If the inventory quantity for the variation is less than or equal to this value and inventory_alert_type is LOW_QUANTITY, the variation displays an alert in the merchant dashboard."
  }

  dimension: inventory_alert_type {
    label: "Variant Inventory Alert Type"
    type: string
    sql: ${TABLE}.inventory_alert_type ;;
    description: "Indicates whether the item variation displays an alert when its inventory quantity is less than or equal to its inventory_alert_threshold."
  }

  dimension: item_id {
    type: number
    hidden: yes
    sql: ${TABLE}.item_id ;;
    description: "The ID of the CatalogItem associated with this item variation. Searchable."
  }

  dimension: name {
    label: "Variant Name"
    type: string
    sql: ${TABLE}.name ;;
    description: "The item variation's name. Searchable. This field has max length of 255 Unicode code points."
  }

  dimension: ordinal {
    label: "Variant Ordinal"
    type: number
    sql: ${TABLE}.ordinal ;;
    description: "Read only The order in which this item variation should be displayed. This value is read-only. On writes, the ordinal for each item variation within a parent CatalogItem is set according to the item variations's position. On reads, the value is not guaranteed to be sequential or unique."
  }

  dimension: price_money {
    label: "Variant Price"
    type: number
    sql: ${TABLE}.price_money ;;
    description: "The item variation's price, if fixed pricing is used."
  }

  dimension: pricing_type {
    label: "Variant Pricing Type"
    type: string
    sql: ${TABLE}.pricing_type ;;
    description: "Indicates whether the item variation's price is fixed or determined at the time of sale."
  }

  dimension: service_duration {
    label: "Variant Service Duration"
    type: number
    sql: ${TABLE}.service_duration ;;
    description: "If the CatalogItem that owns this item variation is of type APPOINTMENTS_SERVICE, then this is the duration of the service in milliseconds. For example, a 30 minute appointment would have the value 1800000, which is equal to 30 (minutes) * 60 (seconds per minute) * 1000 (milliseconds per second)."
  }

  dimension: sku {
    label: "Variant SKU"
    type: number
    sql: ${TABLE}.sku ;;
    description: "The item variation's SKU, if any. Searchable."
  }

  dimension: track_inventory {
    label: "Variant Track Inventory"
    type: number
    sql: ${TABLE}.track_inventory ;;
    description: "If true, inventory tracking is active for the variation."
  }

  dimension: upc {
    label: "Variant UPC"
    type: number
    sql: ${TABLE}.upc ;;
    description: "The item variation's UPC, if any. Searchable in the Connect API. This field is only exposed in the Connect API. It is not exposed in Square's Dashboard, Square Point of Sale app or Retail Point of Sale app."
  }

  dimension: user_data {
    label: "Variant User Data"
    type: string
    sql: ${TABLE}.user_data ;;
    description: "Arbitrary user metadata to associate with the item variation. Searchable. This field has max length of 255 Unicode code points."
  }

  measure: count {
    label: "Variant Count"
    type: count
    drill_fields: [name]
  }
}