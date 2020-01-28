include: "//@{CONFIG_PROJECT_NAME}/*/catalog_tax.view.lkml"

view: catalog_tax {
  extends: [catalog_tax_config]
}

view: catalog_tax_core {
  sql_table_name: Square.CATALOG_TAX ;;

  dimension: applies_to_custom_amounts {
    label: "Tax Applies to Custom Amounts?"
    type: yesno
    sql: ${TABLE}.applies_to_custom_amounts ;;
    description: "If true, the fee applies to custom amounts entered into the Square Point of Sale app that are not associated with a particular CatalogItem."
  }

  dimension: calculation_phase {
    label: "Tax Calculation Phase"
    type: string
    sql: ${TABLE}.calculation_phase ;;
    description: "Whether the tax is calculated based on a payment's subtotal or total."
  }

  dimension: catalog_object_id {
    type: number
    hidden: yes
    primary_key: yes
    sql: ${TABLE}.catalog_object_id ;;
  }

  dimension: enabled {
    label: "Tax Enabled?"
    type: yesno
    sql: ${TABLE}.enabled ;;
    description: "If true, the tax will be shown as enabled in the Square Point of Sale app."
  }

  dimension: inclusion_type {
    label: "Tax Inclusion Type"
    type: string
    sql: ${TABLE}.inclusion_type ;;
    description: "Whether the tax is ADDITIVE or INCLUSIVE."
  }

  dimension: name {
    label: "Tax Name"
    type: string
    sql: ${TABLE}.name ;;
    description: "The tax's name. Searchable. This field has max length of 255 Unicode code points."
  }

  dimension: percentage {
    label: "Tax Percentage"
    type: number
    sql: ${TABLE}.percentage ;;
    description: "The percentage of the tax in decimal form, using a '.' as the decimal separator and without a '%' sign. A value of 7.5 corresponds to 7.5%."
  }

  measure: count {
    label: "Tax Count"
    type: count
    drill_fields: [name, catalog_object.id]
  }
}