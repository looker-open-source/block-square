view: order_service_charge {
  sql_table_name: Square.ORDER_SERVICE_CHARGE ;;

  dimension: amount_money {
    type: number
    sql: ${TABLE}.amount_money ;;
  }

  dimension: applied_money {
    type: number
    sql: ${TABLE}.applied_money ;;
  }

  dimension: calculation_money {
    type: number
    sql: ${TABLE}.calculation_money ;;
  }

  dimension: catalog_object_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.catalog_object_id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: order_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.order_id ;;
  }

  dimension: percentage {
    type: number
    sql: ${TABLE}.percentage ;;
  }

  dimension: taxable {
    type: yesno
    sql: ${TABLE}.taxable ;;
  }

  dimension: total_money {
    type: number
    sql: ${TABLE}.total_money ;;
  }

  dimension: total_tax_money {
    type: number
    sql: ${TABLE}.total_tax_money ;;
  }

  dimension: uid {
    type: number
    value_format_name: id
    sql: ${TABLE}.uid ;;
  }

  measure: count {
    type: count
    drill_fields: [name, catalog_object.id, order.order_source_name, order.id]
  }
}
