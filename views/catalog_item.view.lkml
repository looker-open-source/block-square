view: catalog_item {
  sql_table_name: Square.CATALOG_ITEM ;;

  dimension: abbreviation {
    type: string
    sql: ${TABLE}.abbreviation ;;
  }

  dimension: available_electronically {
    type: yesno
    sql: ${TABLE}.available_electronically ;;
  }

  dimension: available_for_pickup {
    type: yesno
    sql: ${TABLE}.available_for_pickup ;;
  }

  dimension: available_online {
    type: yesno
    sql: ${TABLE}.available_online ;;
  }

  dimension: catalog_object_id {
    type: number
    hidden: yes
    primary_key: yes
    sql: ${TABLE}.catalog_object_id ;;
  }

  dimension: category_id {
    hidden: yes
    type: number
    sql: ${TABLE}.category_id ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: image_url {
    type: string
    sql: ${TABLE}.image_url ;;
  }

  dimension: label_color {
    type: string
    sql: ${TABLE}.label_color ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: product_type {
    type: string
    sql: ${TABLE}.product_type ;;
  }

  dimension: skip_modifier_screen {
    type: yesno
    sql: ${TABLE}.skip_modifier_screen ;;
  }

  measure: count {
    label: "Item Count"
    type: count
    drill_fields: [name, catalog_object.id]
  }
}
