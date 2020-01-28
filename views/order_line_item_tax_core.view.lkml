include: "//@{CONFIG_PROJECT_NAME}/*/order_line_item_tax.view.lkml"

view: order_line_item_tax {
  extends: [order_line_item_tax_config]
}

view: order_line_item_tax_core {
  sql_table_name: @{SCHEMA_NAME}.ORDER_LINE_ITEM_TAX ;;

  dimension: pk {
    hidden: yes
    primary_key: yes
    sql: CONCAT(CAST(${uid} AS STRING), CAST(${order_id} AS STRING)) ;;
  }

  dimension: applied_money {
    label: "Tax Applied Money"
    type: number
    sql: ${TABLE}.applied_money ;;
    description: "The amount of the money applied by the tax in the order."
  }

  dimension: catalog_object_id {
    type: number
    hidden: yes
    sql: ${TABLE}.catalog_object_id ;;
    description: "The catalog object id referencing CatalogTax."
  }

  dimension: name {
    label: "Tax Name"
    type: string
    sql: ${TABLE}.name ;;
    description: "The tax's name."
  }

  dimension: order_id {
    type: number
    hidden: yes
    sql: ${TABLE}.order_id ;;
  }

  dimension: percentage {
    label: "Tax Percentage"
    type: number
    sql: ${TABLE}.percentage ;;
    description: "The percentage of the tax, as a string representation of a decimal number. For example, a value of \"7.25\" corresponds to a percentage of 7.25%."
  }

  dimension: scope {
    label: "Tax Scope"
    type: string
    sql: ${TABLE}.scope ;;
    description: "Indicates the level at which the tax applies. For ORDER scoped taxes, Square generates references in applied_taxes on all order line items that do not have them. For LINE_ITEM scoped taxes, the tax will only apply to line items with references in their applied_taxes field."
  }

  dimension: type {
    label: "Tax Type"
    type: string
    sql: ${TABLE}.type ;;
    description: "Indicates the calculation method used to apply the tax."
  }

  dimension: uid {
    type: number
    hidden: yes
    value_format_name: id
    sql: ${TABLE}.uid ;;
    description: "Unique ID that identifies the tax only within this order."
  }
}