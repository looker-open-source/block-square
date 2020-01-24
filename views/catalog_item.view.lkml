view: catalog_item {
  sql_table_name: Square.CATALOG_ITEM ;;

  dimension: abbreviation {
    type: string
    sql: ${TABLE}.abbreviation ;;
    description: "The text of the item's display label in the Square Point of Sale app. Only up to the first five characters of the string are used. Searchable. This field has max length of 24 Unicode code points."
  }

  dimension: available_electronically {
    type: yesno
    sql: ${TABLE}.available_electronically ;;
    description: "If true, the item can be added to electronically fulfilled orders from the merchant's online store."
  }

  dimension: available_for_pickup {
    type: yesno
    sql: ${TABLE}.available_for_pickup ;;
    description: "If true, the item can be added to pickup orders from the merchant's online store."
  }

  dimension: available_online {
    type: yesno
    sql: ${TABLE}.available_online ;;
    description: "If true, the item can be added to shipping orders from the merchant's online store."
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
    description: "The ID of the item's category, if any."
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
    description: "The item's description. Searchable. This field has max length of 4096 Unicode code points."
  }

  dimension: image_url {
    type: string
    sql: ${TABLE}.image_url ;;
  }

  dimension: label_color {
    type: string
    sql: ${TABLE}.label_color ;;
    description: "The color of the item's display label in the Square Point of Sale app. This must be a valid hex color code."
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
    description: "The item's name. Searchable. This field must not be empty. This field has max length of 512 Unicode code points."
  }

  dimension: product_type {
    type: string
    sql: ${TABLE}.product_type ;;
    description: "The product type of the item. May not be changed once an item has been created."
  }

  dimension: skip_modifier_screen {
    type: yesno
    sql: ${TABLE}.skip_modifier_screen ;;
    description: "If false, the Square Point of Sale app will present the CatalogItem's details screen immediately, allowing the merchant to choose CatalogModifiers before adding the item to the cart.  This is the default behavior."
  }

  measure: count {
    label: "Item Count"
    type: count
    drill_fields: [name, catalog_object.id]
  }
}
