include: "//@{CONFIG_PROJECT_NAME}/*/employee_wage.view.lkml"

view: employee_wage {
  extends: [employee_wage_config]
}

view: employee_wage_core {
  sql_table_name: @{SCHEMA_NAME}.EMPLOYEE_WAGE ;;
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
    description: "UUID for this object."
  }

  dimension: employee_id {
    type: number
    hidden: yes
    sql: ${TABLE}.employee_id ;;
    description: "The Employee that this wage is assigned to."
  }

  dimension: hourly_rate {
    label: "Employee Hourly Rate"
    type: number
    sql: ${TABLE}.hourly_rate ;;
    description: "Can be a custom-set hourly wage or the calculated effective hourly wage based on annual wage and hours worked per week."
  }

  dimension: title {
    label: "Employee Title"
    type: string
    sql: ${TABLE}.title ;;
    description: "The job title that this wage relates to."
  }
}