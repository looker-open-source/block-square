view: catalog_object {
  sql_table_name: Square.CATALOG_OBJECT ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.Id ;;
  }

  dimension: absent_at_location_ids {
    type: number
    value_format_name: id
    sql: ${TABLE}.absent_at_location_ids ;;
  }

  dimension: catalog_v1_ids {
    type: number
    value_format_name: id
    sql: ${TABLE}.catalog_v1_ids ;;
  }

  dimension: is_deleted {
    type: yesno
    sql: ${TABLE}.is_deleted ;;
  }

  dimension: present_at_all_locations {
    type: yesno
    sql: ${TABLE}.present_at_all_locations ;;
  }

  dimension: present_at_location_ids {
    type: number
    value_format_name: id
    sql: ${TABLE}.present_at_location_ids ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
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
  }

  dimension: version {
    type: number
    sql: ${TABLE}.version ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
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
