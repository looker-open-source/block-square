connection: "static_data"

# include all the views
include: "/views/**/*.view"

datagroup: block_square_datagroup {
  sql_trigger: SELECT current_date;;
  max_cache_age: "1 hour"
}

persist_with: block_square_datagroup

explore: additional_recipient_receivable {
  join: transaction {
    type: left_outer
    sql_on: ${additional_recipient_receivable.transaction_id} = ${transaction.id} ;;
    relationship: many_to_one
  }

  join: order {
    type: left_outer
    sql_on: ${transaction.order_id} = ${order.id} ;;
    relationship: many_to_one
  }
}

explore: additional_recipient_receivable_refund {
  join: refund {
    type: left_outer
    sql_on: ${additional_recipient_receivable_refund.refund_id} = ${refund.id} ;;
    relationship: many_to_one
  }

  join: transaction {
    type: left_outer
    sql_on: ${refund.transaction_id} = ${transaction.id} ;;
    relationship: many_to_one
  }

  join: tender {
    type: left_outer
    sql_on: ${refund.tender_id} = ${tender.id} ;;
    relationship: many_to_one
  }

  join: order {
    type: left_outer
    sql_on: ${refund.order_id} = ${order.id} ;;
    relationship: many_to_one
  }

  join: customer {
    type: left_outer
    sql_on: ${tender.customer_id} = ${customer.id} ;;
    relationship: many_to_one
  }
}

explore: additional_recipient_refund {
  join: refund {
    type: left_outer
    sql_on: ${additional_recipient_refund.refund_id} = ${refund.id} ;;
    relationship: many_to_one
  }

  join: transaction {
    type: left_outer
    sql_on: ${refund.transaction_id} = ${transaction.id} ;;
    relationship: many_to_one
  }

  join: tender {
    type: left_outer
    sql_on: ${refund.tender_id} = ${tender.id} ;;
    relationship: many_to_one
  }

  join: order {
    type: left_outer
    sql_on: ${refund.order_id} = ${order.id} ;;
    relationship: many_to_one
  }

  join: customer {
    type: left_outer
    sql_on: ${tender.customer_id} = ${customer.id} ;;
    relationship: many_to_one
  }
}

explore: break_type {}

explore: card {}

explore: catalog_discount {
  join: catalog_object {
    type: left_outer
    sql_on: ${catalog_discount.catalog_object_id} = ${catalog_object.id} ;;
    relationship: many_to_one
  }
}

explore: catalog_item {
  join: catalog_object {
    type: left_outer
    sql_on: ${catalog_item.catalog_object_id} = ${catalog_object.id} ;;
    relationship: many_to_one
  }
}

explore: catalog_item_modifier_list_info {}

explore: catalog_item_modifier_override {}

explore: catalog_item_tax {}

explore: catalog_location {
  join: catalog_object {
    type: left_outer
    sql_on: ${catalog_location.catalog_object_id} = ${catalog_object.id} ;;
    relationship: many_to_one
  }
}

explore: catalog_modifier {
  join: catalog_object {
    type: left_outer
    sql_on: ${catalog_modifier.catalog_object_id} = ${catalog_object.id} ;;
    relationship: many_to_one
  }
}

explore: catalog_modifier_in_catalog_modifier_list {}

explore: catalog_modifier_list {
  join: catalog_object {
    type: left_outer
    sql_on: ${catalog_modifier_list.catalog_object_id} = ${catalog_object.id} ;;
    relationship: many_to_one
  }
}

explore: catalog_object {}

explore: catalog_tax {
  join: catalog_object {
    type: left_outer
    sql_on: ${catalog_tax.catalog_object_id} = ${catalog_object.id} ;;
    relationship: many_to_one
  }
}

explore: customer {}

explore: customer_card {
  join: customer {
    type: left_outer
    sql_on: ${customer_card.customer_id} = ${customer.id} ;;
    relationship: many_to_one
  }

  join: card {
    type: left_outer
    sql_on: ${customer_card.card_id} = ${card.id} ;;
    relationship: many_to_one
  }
}

explore: customer_group_association {
  join: customer {
    type: left_outer
    sql_on: ${customer_group_association.customer_id} = ${customer.id} ;;
    relationship: many_to_one
  }
}

explore: customer_group_info {}

explore: employee {}

explore: employee_location {
  join: employee {
    type: left_outer
    sql_on: ${employee_location.employee_id} = ${employee.id} ;;
    relationship: many_to_one
  }
}

explore: employee_wage {
  join: employee {
    type: left_outer
    sql_on: ${employee_wage.employee_id} = ${employee.id} ;;
    relationship: many_to_one
  }
}

explore: inventory_count_history {
  join: catalog_object {
    type: left_outer
    sql_on: ${inventory_count_history.catalog_object_id} = ${catalog_object.id} ;;
    relationship: many_to_one
  }
}

explore: order {}

explore: order_fulfillment {
  join: catalog_object {
    type: left_outer
    sql_on: ${order_fulfillment.catalog_object_id} = ${catalog_object.id} ;;
    relationship: many_to_one
  }

  join: order {
    type: left_outer
    sql_on: ${order_fulfillment.order_id} = ${order.id} ;;
    relationship: many_to_one
  }
}

explore: order_line_item {
  join: catalog_object {
    type: left_outer
    sql_on: ${order_line_item.catalog_object_id} = ${catalog_object.id} ;;
    relationship: many_to_one
  }

  join: order {
    type: left_outer
    sql_on: ${order_line_item.order_id} = ${order.id} ;;
    relationship: many_to_one
  }
}

explore: order_line_item_modifier {
  join: catalog_object {
    type: left_outer
    sql_on: ${order_line_item_modifier.catalog_object_id} = ${catalog_object.id} ;;
    relationship: many_to_one
  }
}

explore: order_line_item_tax {
  join: catalog_object {
    type: left_outer
    sql_on: ${order_line_item_tax.catalog_object_id} = ${catalog_object.id} ;;
    relationship: many_to_one
  }

  join: order {
    type: left_outer
    sql_on: ${order_line_item_tax.order_id} = ${order.id} ;;
    relationship: many_to_one
  }
}

explore: order_return {}

explore: order_return_line_item {
  join: catalog_object {
    type: left_outer
    sql_on: ${order_return_line_item.catalog_object_id} = ${catalog_object.id} ;;
    relationship: many_to_one
  }
}

explore: order_return_line_item_modifier {
  join: catalog_object {
    type: left_outer
    sql_on: ${order_return_line_item_modifier.catalog_object_id} = ${catalog_object.id} ;;
    relationship: many_to_one
  }
}

explore: order_service_charge {
  join: catalog_object {
    type: left_outer
    sql_on: ${order_service_charge.catalog_object_id} = ${catalog_object.id} ;;
    relationship: many_to_one
  }

  join: order {
    type: left_outer
    sql_on: ${order_service_charge.order_id} = ${order.id} ;;
    relationship: many_to_one
  }
}

explore: refund {
  join: transaction {
    type: left_outer
    sql_on: ${refund.transaction_id} = ${transaction.id} ;;
    relationship: many_to_one
  }

  join: tender {
    type: left_outer
    sql_on: ${refund.tender_id} = ${tender.id} ;;
    relationship: many_to_one
  }

  join: order {
    type: left_outer
    sql_on: ${refund.order_id} = ${order.id} ;;
    relationship: many_to_one
  }

  join: customer {
    type: left_outer
    sql_on: ${tender.customer_id} = ${customer.id} ;;
    relationship: many_to_one
  }
}

explore: tender {
  join: transaction {
    type: left_outer
    sql_on: ${tender.transaction_id} = ${transaction.id} ;;
    relationship: many_to_one
  }

  join: customer {
    type: left_outer
    sql_on: ${tender.customer_id} = ${customer.id} ;;
    relationship: many_to_one
  }

  join: order {
    type: left_outer
    sql_on: ${tender.order_id} = ${order.id} ;;
    relationship: many_to_one
  }
}

explore: tender_additional_recipient {
  join: tender {
    type: left_outer
    sql_on: ${tender_additional_recipient.tender_id} = ${tender.id} ;;
    relationship: many_to_one
  }

  join: transaction {
    type: left_outer
    sql_on: ${tender.transaction_id} = ${transaction.id} ;;
    relationship: many_to_one
  }

  join: customer {
    type: left_outer
    sql_on: ${tender.customer_id} = ${customer.id} ;;
    relationship: many_to_one
  }

  join: order {
    type: left_outer
    sql_on: ${tender.order_id} = ${order.id} ;;
    relationship: many_to_one
  }
}

explore: transaction {
  join: order {
    type: left_outer
    sql_on: ${transaction.order_id} = ${order.id} ;;
    relationship: many_to_one
  }
}

explore: workweek_history {}