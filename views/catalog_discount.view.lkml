view: catalog_discount {
  sql_table_name: Square.CATALOG_DISCOUNT ;;

  dimension: amount_money {
    label: "Discount Amount"
    type: number
    sql: ${TABLE}.amount_money ;;
  }

  dimension: catalog_object_id {
    type: number
    hidden: yes
    primary_key: yes
    sql: ${TABLE}.catalog_object_id ;;
  }

  dimension: discount_type {
    label: "Discount Type"
    type: string
    sql: ${TABLE}.discount_type ;;
  }

  dimension: label_color {
    label: "Discount Label Color"
    type: string
    sql: ${TABLE}.label_color ;;
  }

  dimension: name {
    label: "Discount Name"
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: percentage {
    label: "Discount Percentage"
    type: number
    sql: ${TABLE}.percentage ;;
  }

  dimension: pin_required {
    label: "Discount PIN Required?"
    type: yesno
    sql: ${TABLE}.pin_required ;;
  }

  measure: count {
    label: "Discount Count"
    type: count
    drill_fields: [name, catalog_object.id]
  }
}
