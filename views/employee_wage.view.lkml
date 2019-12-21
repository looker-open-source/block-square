view: employee_wage {
  sql_table_name: Square.EMPLOYEE_WAGE ;;
  drill_fields: [id]

  dimension: pk {
    hidden: yes
    primary_key: yes
    sql: CONCAT(CAST(${id} AS STRING), CAST(${employee_id} AS STRING)) ;;
  }

  dimension: id {
    hidden: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: employee_id {
    type: number
    hidden: yes
    sql: ${TABLE}.employee_id ;;
  }

  dimension: hourly_rate {
    label: "Employee Hourly Rate"
    type: number
    sql: ${TABLE}.hourly_rate ;;
  }

  dimension: title {
    label: "Employee Title"
    type: string
    sql: ${TABLE}.title ;;
  }

}
