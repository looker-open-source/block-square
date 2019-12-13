view: catalog_location {
  sql_table_name: Square.CATALOG_LOCATION ;;

  dimension: absent {
    type: yesno
    sql: ${TABLE}.absent ;;
  }

  dimension: catalog_object_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.catalog_object_id ;;
  }

  dimension: location_id {
    type: number
    sql: ${TABLE}.location_id ;;
  }

  dimension: present {
    type: yesno
    sql: ${TABLE}.present ;;
  }

  measure: count {
    type: count
    drill_fields: [catalog_object.id]
  }
}
