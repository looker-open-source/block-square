include: "//@{CONFIG_PROJECT_NAME}/*/catalog_modifier_list.view.lkml"

view: catalog_modifier_list {
  extends: [catalog_modifier_list_config]
}

view: catalog_modifier_list_core {
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
    description: "A searchable name for the CatalogModifierList. This field has max length of 255 Unicode code points."
  }

  dimension: selection_type {
    label: "Modifier List Selection Type"
    type: string
    sql: ${TABLE}.selection_type ;;
    description: "Indicates whether multiple options from the CatalogModifierList can be applied to a single CatalogItem."
  }
}