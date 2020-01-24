view: catalog_item_modifier_list_info {
  sql_table_name: Square.CATALOG_ITEM_MODIFIER_LIST_INFO ;;

  dimension: pk {
    hidden: yes
    primary_key: yes
    sql: CONCAT(CAST(${catalog_item_id} AS STRING), CAST(${modifier_list_id} AS STRING)) ;;
  }

  dimension: catalog_item_id {
    type: number
    hidden: yes
    sql: ${TABLE}.catalog_item_id ;;
  }

  dimension: enabled {
    label: "Modifier Enabled?"
    type: yesno
    sql: ${TABLE}.enabled ;;
  }

  dimension: max_selected_modifiers {
    label: "Modifier Max Modifiers"
    type: number
    sql: ${TABLE}.max_selected_modifiers ;;
  }

  dimension: min_selected_modifiers {
    label: "Modifier Min Modifiers"
    type: number
    sql: ${TABLE}.min_selected_modifiers ;;
  }

  dimension: modifier_list_id {
    type: number
    hidden: yes
    sql: ${TABLE}.modifier_list_id ;;
  }

}
