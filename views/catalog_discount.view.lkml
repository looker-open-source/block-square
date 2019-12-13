view: catalog_discount {
  sql_table_name: Square.CATALOG_DISCOUNT ;;

  dimension: amount_money {
    type: number
    sql: ${TABLE}.amount_money ;;
  }

  dimension: catalog_object_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.catalog_object_id ;;
  }

  dimension: discount_type {
    type: string
    sql: ${TABLE}.discount_type ;;
  }

  dimension: label_color {
    type: string
    sql: ${TABLE}.label_color ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: percentage {
    type: number
    sql: ${TABLE}.percentage ;;
  }

  dimension: pin_required {
    type: yesno
    sql: ${TABLE}.pin_required ;;
  }

  measure: count {
    type: count
    drill_fields: [name, catalog_object.id]
  }
}
