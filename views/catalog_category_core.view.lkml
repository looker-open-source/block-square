include: "//@{CONFIG_PROJECT_NAME}/*/catalog_category.view.lkml"

view: catalog_category {
  extends: [catalog_category_config]
}

view: catalog_category_core {
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
    description: "The category name. Searchable. This field has max length of 255 Unicode code points."
  }

  measure: count {
    label: "Category Count"
    type: count
    drill_fields: [name]
  }
}