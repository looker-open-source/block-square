view: customer_group_info {
  sql_table_name: Square.CUSTOMER_GROUP_INFO ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: name {
    label: "Group Name"
    type: string
    sql: ${TABLE}.name ;;
  }

}
