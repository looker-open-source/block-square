include: "//@{CONFIG_PROJECT_NAME}/*/employee_location.view.lkml"

view: employee_location {
  extends: [employee_location_config]
}

view: employee_location_core {
  sql_table_name: @{SCHEMA_NAME}.EMPLOYEE_LOCATION ;;

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