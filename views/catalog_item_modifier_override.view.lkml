view: catalog_item_modifier_override {
  sql_table_name: Square.CATALOG_ITEM_MODIFIER_OVERRIDE ;;

  dimension: catalog_item_id {
    type: number
    sql: ${TABLE}.catalog_item_id ;;
  }

  dimension: modifier_id {
    type: number
    sql: ${TABLE}.modifier_id ;;
  }

  dimension: modifier_list_id {
    type: number
    sql: ${TABLE}.modifier_list_id ;;
  }

  dimension: on_by_default {
    type: yesno
    sql: ${TABLE}.on_by_default ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
