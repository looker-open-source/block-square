include: "//@{CONFIG_PROJECT_NAME}/*/catalog_item_modifier_override.view.lkml"

view: catalog_item_modifier_override {
  extends: [catalog_item_modifier_override_config]
}

view: catalog_item_modifier_override_core {
  sql_table_name: @{SCHEMA_NAME}.CATALOG_ITEM_MODIFIER_OVERRIDE ;;

  dimension: pk {
    hidden: yes
    primary_key: yes
    sql: CONCAT(CAST(${catalog_item_id} AS STRING), CAST(${modifier_list_id} AS STRING), CAST(${modifier_id} AS STRING)) ;;
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
}