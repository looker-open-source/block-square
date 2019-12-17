view: catalog_item_modifier_override {
  sql_table_name: Square.CATALOG_ITEM_MODIFIER_OVERRIDE ;;

  dimension: pk {
    hidden: yes
    primary_key: yes
    sql: CONCAT(${catalog_item_id}, ${modifier_list_id}, ${modifier_id}) ;;
  }

  dimension: catalog_item_id {
    hidden: yes
    type: number
    sql: ${TABLE}.catalog_item_id ;;
  }

  dimension: modifier_id {
    type: number
    hidden: yes
    sql: ${TABLE}.modifier_id ;;
  }

  dimension: modifier_list_id {
    hidden: yes
    type: number
    sql: ${TABLE}.modifier_list_id ;;
  }

  dimension: on_by_default {
    label: "Modifier Override Is Default?"
    type: yesno
    sql: ${TABLE}.on_by_default ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
