view: catalog_modifier {
  sql_table_name: Square.CATALOG_MODIFIER ;;

  dimension: catalog_object_id {
    type: number
    hidden: yes
    primary_key: yes
    sql: ${TABLE}.catalog_object_id ;;
  }

  dimension: name {
    label: "Modifier Name"
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: price_money {
    label: "Modifier Price"
    type: number
    sql: ${TABLE}.price_money ;;
  }

  measure: count {
    label: "Modifier Count"
    type: count
    drill_fields: [name, catalog_object.id]
  }
}
