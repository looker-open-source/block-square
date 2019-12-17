view: inventory_count_history {
  sql_table_name: Square.INVENTORY_COUNT_HISTORY ;;

  dimension: pk {
    hidden: yes
    primary_key: yes
    sql: CONCAT(${catalog_object_id}, ${location_id}, ${calculated_raw}) ;;
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
  }

  dimension: catalog_object_id {
    type: number
    hidden: yes
    sql: ${TABLE}.catalog_object_id ;;
  }

  dimension: catalog_object_type {
    label: "History Catalog Object Type"
    type: string
    sql: ${TABLE}.catalog_object_type ;;
  }

  dimension: location_id {
    label: "History Location ID"
    type: number
    sql: ${TABLE}.location_id ;;
  }

  dimension: quantity {
    label: "History Quantity"
    type: number
    sql: ${TABLE}.quantity ;;
  }

  dimension: state {
    label: "History State"
    type: string
    sql: ${TABLE}.state ;;
  }
}
