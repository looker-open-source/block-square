view: catalog_tax {
  sql_table_name: Square.CATALOG_TAX ;;

  dimension: applies_to_custom_amounts {
    label: "Tax Applies to Custom Amounts?"
    type: yesno
    sql: ${TABLE}.applies_to_custom_amounts ;;
  }

  dimension: calculation_phase {
    label: "Tax Calculation Phase"
    type: string
    sql: ${TABLE}.calculation_phase ;;
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
  }

  dimension: inclusion_type {
    label: "Tax Inclusion Type"
    type: string
    sql: ${TABLE}.inclusion_type ;;
  }

  dimension: name {
    label: "Tax Name"
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: percentage {
    label: "Tax Percentage"
    type: number
    sql: ${TABLE}.percentage ;;
  }

  measure: count {
    label: "Tax Count"
    type: count
    drill_fields: [name, catalog_object.id]
  }
}
