view: employee_location {
  sql_table_name: Square.EMPLOYEE_LOCATION ;;

  dimension: pk {
    hidden: yes
    primary_key: yes
    sql: CONCAT(CAST(${employee_id} AS STRING), CAST(${location_id} AS STRING)) ;;
  }

  dimension: employee_id {
    type: number
    hidden: yes
    sql: ${TABLE}.employee_id ;;
  }

  dimension: location_id {
    label: "Employee Location ID"
    type: number
    sql: ${TABLE}.location_id ;;
  }
}
