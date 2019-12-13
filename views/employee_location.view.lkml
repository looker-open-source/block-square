view: employee_location {
  sql_table_name: Square.EMPLOYEE_LOCATION ;;

  dimension: employee_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.employee_id ;;
  }

  dimension: location_id {
    type: number
    sql: ${TABLE}.location_id ;;
  }

  measure: count {
    type: count
    drill_fields: [employee.last_name, employee.id, employee.first_name]
  }
}
