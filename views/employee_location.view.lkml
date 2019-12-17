view: employee_location {
  sql_table_name: Square.EMPLOYEE_LOCATION ;;

  dimension: pk {
    hidden: yes
    primary_key: yes
    sql: CONCAT(${employee_id}, ${location_id}) ;;
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
