view: employee_wage {
  sql_table_name: Square.EMPLOYEE_WAGE ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: employee_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.employee_id ;;
  }

  dimension: hourly_rate {
    type: number
    sql: ${TABLE}.hourly_rate ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  measure: count {
    type: count
    drill_fields: [id, employee.last_name, employee.id, employee.first_name]
  }
}
