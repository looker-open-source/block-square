include: "//@{CONFIG_PROJECT_NAME}/*/catalog_object.view.lkml"

view: catalog_object {
  extends: [catalog_object_config]
}

view: catalog_object_core {
  sql_table_name: Square.CATALOG_OBJECT ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.Id ;;
    description: "An identifier to reference this object in the catalog. When a new CatalogObject is inserted, the client should set the id to a temporary identifier starting with a "#" character. Other objects being inserted or updated within the same request may use this identifier to refer to the new object."
  }

  dimension: absent_at_location_ids {
    type: number
    value_format_name: id
    sql: ${TABLE}.absent_at_location_ids ;;
    description: "A list of locations where the object is not present, even if present_at_all_locations is true."
  }

  dimension: catalog_v1_ids {
    type: number
    value_format_name: id
    sql: ${TABLE}.catalog_v1_ids ;;
    description: "The Connect v1 IDs for this object at each location where it is present, where they differ from the object's Connect V2 ID. The field will only be present for objects that have been created or modified by legacy APIs."
  }

  dimension: is_deleted {
    type: yesno
    sql: ${TABLE}.is_deleted ;;
    description: "If true, the object has been deleted from the database. Must be false for new objects being inserted. When deleted, the updated_at field will equal the deletion time."
  }

  dimension: present_at_all_locations {
    type: yesno
    sql: ${TABLE}.present_at_all_locations ;;
    description: "If true, this object is present at all locations (including future locations), except where specified in the absent_at_location_ids field. If false, this object is not present at any locations (including future locations), except where specified in the present_at_location_ids field. If not specified, defaults to true."
  }

  dimension: present_at_location_ids {
    type: number
    value_format_name: id
    sql: ${TABLE}.present_at_location_ids ;;
    description: "A list of locations where the object is present, even if present_at_all_locations is false."
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
    description: "The type of this object. Each object type has expected properties expressed in a structured format within its corresponding *_data field below."
  }

  dimension: version {
    type: number
    sql: ${TABLE}.version ;;
    description: "The version of the object. When updating an object, the version supplied must match the version in the database, otherwise the write will be rejected as conflicting."
  }

  dimension_group: updated {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.updated_at ;;
    description: "Last modification timestamp in RFC 3339 format, e.g., \"2016-08-15T23:59:33.123Z\" would indicate the UTC time (denoted by Z) of August 15, 2016 at 23:59:33 and 123 milliseconds."
  }

  set: detail {
    fields: [
      id,
      inventory_count_history.count,
      catalog_location.count,
      order_service_charge.count,
      order_return_line_item.count,
      order_line_item_tax.count,
      order_line_item.count,
      catalog_tax.count,
      catalog_modifier_list.count,
      order_return_line_item_modifier.count,
      catalog_item.count,
      order_line_item_modifier.count,
      catalog_modifier.count,
      catalog_discount.count,
      order_fulfillment.count
    ]
  }
}