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
    description: "The amount of a non-percentage based service charge."
  }

  dimension: applied_money {
    label: "Service Charge Applied"
    type: number
    sql: ${TABLE}.applied_money ;;
    description: "Read only The amount of money applied to the order by the service charge, including any inclusive tax amounts, as calculated by Square."
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
    description: "The catalog object ID referencing the service charge CatalogObject."
  }

  dimension: name {
    label: "Service Charge Name"
    type: string
    sql: ${TABLE}.name ;;
    description: "The name of the service charge."
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
    description: "The service charge percentage as a string representation of a decimal number. For example, \"7.25\" indicates a service charge of 7.25%."
  }

  dimension: taxable {
    label: "Service Charge Taxable"
    type: yesno
    sql: ${TABLE}.taxable ;;
    description: "Indicates whether the service charge can be taxed. If set to true, order-level taxes automatically apply to the service charge. Note that service charges calculated in the TOTAL_PHASE cannot be marked as taxable."
  }

  dimension: total_money {
    label: "Service Charge Total"
    type: number
    sql: ${TABLE}.total_money ;;
    description: "Read only The total amount of money to collect for the service charge."
  }

  dimension: total_tax_money {
    label: "Service Charge Total Tax"
    type: number
    sql: ${TABLE}.total_tax_money ;;
    description: "Read only The total amount of tax money to collect for the service charge."
  }

  dimension: uid {
    type: number
    hidden: yes
    value_format_name: id
    sql: ${TABLE}.uid ;;
    description: "Unique ID that identifies the service charge only within this order."
  }
}
