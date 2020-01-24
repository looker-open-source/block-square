view: inventory_count_history {
  sql_table_name: Square.INVENTORY_COUNT_HISTORY ;;

  dimension: pk {
    hidden: yes
    primary_key: yes
    sql: CONCAT(CAST(${catalog_object_id} AS STRING), CAST(${location_id} AS STRING), CAST(${calculated_raw} AS STRING)) ;;
  }

  dimension: catalog_object_id {
    type: number
    hidden: yes
    sql: ${TABLE}.catalog_object_id ;;
    description: "The Square generated ID of the CatalogObject being tracked."
  }

  dimension: catalog_object_type {
    label: "History Catalog Object Type"
    type: string
    sql: ${TABLE}.catalog_object_type ;;
    description: "The CatalogObjectType of the CatalogObject being tracked. Tracking is only supported for the ITEM_VARIATION type."
  }

  dimension: location_id {
    label: "History Location ID"
    type: number
    sql: ${TABLE}.location_id ;;
    description: "The Square ID of the Location where the related quantity of items are being tracked."
  }

  dimension: quantity {
    label: "History Quantity"
    type: number
    sql: ${TABLE}.quantity ;;
    description: "The number of items affected by the estimated count as a decimal string. Can support up to 5 digits after the decimal point."
  }

  dimension: state {
    label: "History State"
    type: string
    sql: ${TABLE}.state ;;
    description: "The current InventoryState for the related quantity of items."
  }

  dimension_group: calculated {
    label: "History Calculated At"
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.calculated_at ;;
    description: "A read-only timestamp in RFC 3339 format that indicates when Square received the most recent physical count or adjustment that had an affect on the estimated count."
  }

  measure: total_quantity {
    label: "History Quantity"
    type: sum
    sql: ${quantity} ;;
  }
}
