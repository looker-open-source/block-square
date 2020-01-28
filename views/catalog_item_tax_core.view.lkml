include: "//@{CONFIG_PROJECT_NAME}/catalog_item_tax.view.lkml"

view: catalog_item_tax {
  extends: [catalog_item_tax_config]
}

view: catalog_item_tax {
  sql_table_name: Square.CATALOG_ITEM_TAX ;;

  dimension: pk {
    hidden: yes
    primary_key: yes
    sql: CONCAT(CAST(${catalog_item_id} AS STRING), CAST(${tax_id} AS STRING)) ;;
  }

  dimension: catalog_item_id {
    type: number
    sql: ${TABLE}.catalog_item_id ;;
  }

  dimension: tax_id {
    type: number
    sql: ${TABLE}.tax_id ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
