view: catalog_item_tax {
  sql_table_name: Square.CATALOG_ITEM_TAX ;;

  dimension: pk {
    hidden: yes
    primary_key: yes
    sql: CONCAT(${catalog_item_id}, ${tax_id}) ;;
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
