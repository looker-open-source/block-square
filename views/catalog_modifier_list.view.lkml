view: catalog_modifier_list {
  sql_table_name: Square.CATALOG_MODIFIER_LIST ;;

  dimension: catalog_object_id {
    type: number
    hidden: yes
    primary_key: yes
    sql: ${TABLE}.catalog_object_id ;;
  }

  dimension: name {
    label: "Modifier List Name"
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: selection_type {
    label: "Modifier List Selection Type"
    type: string
    sql: ${TABLE}.selection_type ;;
  }

}
