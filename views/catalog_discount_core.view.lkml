include: "//@{CONFIG_PROJECT_NAME}/*/catalog_discount.view.lkml"

view: catalog_discount {
  extends: [catalog_discount_config]
}

view: catalog_discount_core {
  sql_table_name: @{SCHEMA_NAME}.CATALOG_DISCOUNT ;;

  dimension: amount_money {
    label: "Discount Amount"
    type: number
    sql: ${TABLE}.amount_money ;;
    description: "The amount of the discount. Specify an amount of 0 if discount_type is VARIABLE_AMOUNT."
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
    description: "Indicates whether the discount is a fixed amount or percentage, or entered at the time of sale."
  }

  dimension: label_color {
    label: "Discount Label Color"
    type: string
    sql: ${TABLE}.label_color ;;
    description: "The color of the discount display label in the Square Point of Sale app. This must be a valid hex color code."
  }

  dimension: name {
    label: "Discount Name"
    type: string
    sql: ${TABLE}.name ;;
    description: "The discount name. Searchable. This field has max length of 255 Unicode code points."
  }

  dimension: percentage {
    label: "Discount Percentage"
    type: number
    sql: ${TABLE}.percentage ;;
    description: "The percentage of the discount as a string representation of a decimal number, using a . as the decimal separator and without a % sign. A value of 7.5 corresponds to 7.5%. Specify a percentage of 0 if discount_type is VARIABLE_PERCENTAGE."
  }

  dimension: pin_required {
    label: "Discount PIN Required?"
    type: yesno
    sql: ${TABLE}.pin_required ;;
    description: "Indicates whether a mobile staff member needs to enter their PIN to apply the discount to a payment in the Square Point of Sale app."
  }

  measure: count {
    label: "Discount Count"
    type: count
    drill_fields: [name, catalog_object.id]
  }
}