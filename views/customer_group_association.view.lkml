view: customer_group_association {
  sql_table_name: Square.CUSTOMER_GROUP_ASSOCIATION ;;

  dimension: pk {
    hidden: yes
    primary_key: yes
    sql: CONCAT(CAST(${customer_id} AS STRING), CAST(${group_id} AS STRING)) ;;
  }

  dimension: customer_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.customer_id ;;
  }

  dimension: group_id {
    type: number
    sql: ${TABLE}.group_id ;;
  }

  measure: count {
    type: count
    drill_fields: [customer.given_name, customer.company_name, customer.nickname, customer.id, customer.family_name]
  }
}
