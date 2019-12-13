view: catalog_item_modifier_list_info {
  sql_table_name: Square.CATALOG_ITEM_MODIFIER_LIST_INFO ;;

  dimension: catalog_item_id {
    type: number
    sql: ${TABLE}.catalog_item_id ;;
  }

  dimension: enabled {
    type: yesno
    sql: ${TABLE}.enabled ;;
  }

  dimension: max_selected_modifiers {
    type: number
    sql: ${TABLE}.max_selected_modifiers ;;
  }

  dimension: min_selected_modifiers {
    type: number
    sql: ${TABLE}.min_selected_modifiers ;;
  }

  dimension: modifier_list_id {
    type: number
    sql: ${TABLE}.modifier_list_id ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
