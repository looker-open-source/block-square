view: catalog_location {
  sql_table_name: Square.CATALOG_LOCATION ;;

  dimension: pk {
    hidden: yes
    primary_key: yes
    sql: CONCAT(CAST(${catalog_object_id} AS STRING), CAST(${location_id} AS STRING)) ;;
  }

  dimension: absent {
    label: "Location Absent?"
    type: yesno
    sql: ${TABLE}.absent ;;
  }

  dimension: catalog_object_id {
    type: number
    hidden: yes
    sql: ${TABLE}.catalog_object_id ;;
  }

  dimension: location_id {
    type: number
    hidden: yes
    sql: ${TABLE}.location_id ;;
  }

  dimension: present {
    label: "Location Present?"
    type: yesno
    sql: ${TABLE}.present ;;
  }

  measure: count {
    label: "Location Count"
    type: count
    drill_fields: [catalog_object.id]
  }
}
