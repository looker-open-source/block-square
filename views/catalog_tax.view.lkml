view: catalog_tax {
  sql_table_name: Square.CATALOG_TAX ;;

  dimension: applies_to_custom_amounts {
    type: yesno
    sql: ${TABLE}.applies_to_custom_amounts ;;
  }

  dimension: calculation_phase {
    type: string
    sql: ${TABLE}.calculation_phase ;;
  }

  dimension: catalog_object_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.catalog_object_id ;;
  }

  dimension: enabled {
    type: yesno
    sql: ${TABLE}.enabled ;;
  }

  dimension: inclusion_type {
    type: string
    sql: ${TABLE}.inclusion_type ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: percentage {
    type: number
    sql: ${TABLE}.percentage ;;
  }

  measure: count {
    type: count
    drill_fields: [name, catalog_object.id]
  }
}
