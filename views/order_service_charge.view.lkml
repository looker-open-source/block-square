view: order_service_charge {
  sql_table_name: Square.ORDER_SERVICE_CHARGE ;;

  dimension: pk {
    hidden: yes
    primary_key: yes
    sql: CONCAT(CAST(${uid} AS STRING), CAST(${order_id} AS STRING)) ;;
  }

  dimension: amount_money {
    label: "Service Charge Amount"
    type: number
    sql: ${TABLE}.amount_money ;;
  }

  dimension: applied_money {
    label: "Service Charge Applied"
    type: number
    sql: ${TABLE}.applied_money ;;
  }

  dimension: calculation_money {
    label: "Service Charge Calculation"
    type: number
    sql: ${TABLE}.calculation_money ;;
  }

  dimension: catalog_object_id {
    type: number
    hidden: yes
    sql: ${TABLE}.catalog_object_id ;;
  }

  dimension: name {
    label: "Service Charge Name"
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: order_id {
    type: number
    hidden: yes
    sql: ${TABLE}.order_id ;;
  }

  dimension: percentage {
    label: "Service Charge Percentage"
    type: number
    sql: ${TABLE}.percentage ;;
  }

  dimension: taxable {
    label: "Service Charge Taxable"
    type: yesno
    sql: ${TABLE}.taxable ;;
  }

  dimension: total_money {
    label: "Service Charge Total"
    type: number
    sql: ${TABLE}.total_money ;;
  }

  dimension: total_tax_money {
    label: "Service Charge Total Tax"
    type: number
    sql: ${TABLE}.total_tax_money ;;
  }

  dimension: uid {
    type: number
    hidden:  yes
    value_format_name: id
    sql: ${TABLE}.uid ;;
  }

}
