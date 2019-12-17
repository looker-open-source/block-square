view: catalog_category {
  sql_table_name: Square.CATALOG_CATEGORY ;;

  dimension: catalog_object_id {
    hidden: yes
    primary_key: yes
    type: number
    sql: ${TABLE}.catalog_object_id ;;
  }

  dimension: name {
    label: "Category Name"
    type: string
    sql: ${TABLE}.name ;;
  }

  measure: count {
    label: "Category Count"
    type: count
    drill_fields: [name]
  }
}
