connection: "static_data"

# include all the views
include: "/views/**/*.view"

datagroup: block_square_datagroup {
  sql_trigger: SELECT current_date;;
  max_cache_age: "1 hour"
}

persist_with: block_square_datagroup

explore: order {
  view_label: "Order️"
  # PAYMENT
  join: transaction {
    view_label: "Tender️"
    type: left_outer
    sql_on: ${order.id} = ${transaction.order_id} ;;
    relationship: one_to_many
  }
  join: tender {
    view_label: "Tender️"
    type: left_outer
    sql_on: ${transaction.id} = ${tender.transaction_id} ;;
    relationship: one_to_many
  }
  join: customer {
    view_label: "Customer️"
    type: left_outer
    sql_on: ${tender.customer_id} = ${customer.id} ;;
    relationship: many_to_one
  }
  join: customer_card {
    type: left_outer
    sql_on: ${customer.id} = ${customer_card.customer_id} ;;
    relationship: one_to_many
    fields: []
  }
  join: card {
    view_label: "Customer️"
    type: left_outer
    sql_on: ${customer_card.card_id} = ${card.id} ;;
    relationship: one_to_one
  }
  join: customer_group_association {
    type: left_outer
    sql_on: ${customer.id} = ${customer_group_association.customer_id} ;;
    relationship: many_to_one
    fields: []
  }
  join: customer_group_info {
    view_label: "Customer️"
    type: left_outer
    sql_on: ${customer_group_association.group_id} = ${customer_group_info.id} ;;
    relationship: many_to_one
  }
  join: tender_additional_recipient {
    view_label: "Tender️"
    type: left_outer
    sql_on: ${tender.id} = ${tender_additional_recipient.tender_id} ;;
    relationship: one_to_many
  }
  join: refund {
    view_label: "Refund"
    type: left_outer
    sql_on: ${transaction.id} = ${refund.transaction_id} ;;
    relationship: one_to_many
  }
  join: additional_recipient_refund {
    view_label: "Refund"
    type: left_outer
    sql_on: ${refund.id} = ${additional_recipient_refund.refund_id} ;;
    relationship: one_to_many
  }
  join: additional_recipient_receivable {
    view_label: "Tender️"
    type: left_outer
    sql_on: ${transaction.id} = ${additional_recipient_receivable.transaction_id} ;;
    relationship: one_to_many
  }
  join: additional_recipient_receivable_refund {
    view_label: "Refund"
    type: left_outer
    sql_on: ${additional_recipient_receivable.id} = ${additional_recipient_receivable_refund.receivable_id} ;;
    relationship: one_to_many
  }
  # SHOP
  join: location {
    view_label: "Location"
    type: left_outer
    sql_on: ${order.location_id} = ${location.id} ;;
    relationship: many_to_one
  }
  join: employee_location {
    view_label: "Employee️"
    type: left_outer
    sql_on: ${location.id} = ${employee_location.location_id} ;;
    relationship: one_to_many
  }
  join: employee {
    view_label: "Employee️"
    type: left_outer
    sql_on: ${employee_location.employee_id} = ${employee.id} ;;
    relationship: many_to_one
  }
  join: employee_wage {
    view_label: "Employee️"
    type: left_outer
    sql_on: ${employee.id} = ${employee_wage.employee_id} ;;
    relationship: one_to_one
  }
  join: break_type {
    view_label: "Location"
    type: left_outer
    sql_on: ${location.id} = ${break_type.location_id} ;;
    relationship: one_to_many
  }
  # ORDER
  join: order_line_item {
    view_label: "Order Line Item️"
    type: left_outer
    sql_on: ${order.id} = ${order_line_item.order_id} ;;
    relationship: one_to_many
  }
  join: order_line_item_modifier {
    view_label: "Order Line Item️"
    type: left_outer
    sql_on: ${order_line_item.uid} = ${order_line_item_modifier.order_line_item_id} ;;
    relationship: one_to_many
  }
  join: order_return {
    view_label: "Order Return️"
    type: left_outer
    sql_on: ${order.id} = ${order_return.source_order_id} ;;
    relationship: one_to_one
  }
  join: order_return_line_item {
    view_label: "Order Return️"
    type: left_outer
    sql_on: ${order_return.uid} = ${order_return_line_item.order_return_id} ;;
    relationship: one_to_many
  }
  join: order_return_line_item_modifier {
    view_label: "Order Return️"
    type: left_outer
    sql_on: ${order_return_line_item.uid} = ${order_return_line_item_modifier.order_return_line_item_id} ;;
    relationship: one_to_one
  }
  join: order_line_item_tax {
    view_label: "Order Line Item️"
    type: left_outer
    sql_on: ${order.id} = ${order_line_item_tax.order_id} ;;
    relationship: one_to_many
  }
  join: order_line_item_discount {
    view_label: "Order Line Item️"
    type: left_outer
    sql_on: ${order.id} = ${order_line_item_discount.order_id} ;;
    relationship: one_to_many
  }
  join: order_fulfillment {
    view_label: "Order Line Item️"
    type: left_outer
    sql_on: ${order.id} = ${order_fulfillment.order_id} ;;
    relationship: one_to_many
  }
  join: order_service_charge {
    view_label: "Order Line Item️"
    type: left_outer
    sql_on: ${order.id} = ${order_line_item.order_id} ;;
    relationship: one_to_many
  }
  join: catalog_object {
    view_label: "Catalog"
    type: left_outer
    sql_on: ${order_line_item.catalog_object_id} = ${catalog_object.id} ;;
    relationship: many_to_one
  }
  join: catalog_item {
    view_label: "Catalog"
    type: left_outer
    sql_on: ${catalog_object.id} = ${catalog_item.catalog_object_id} ;;
    relationship: one_to_one
  }
  join: inventory_count_history {
    view_label: "Catalog"
    type: left_outer
    sql_on: ${catalog_object.id} = ${inventory_count_history.catalog_object_id} ;;
    relationship: one_to_many
  }
  join: catalog_item_variation {
    view_label: "Catalog"
    type: left_outer
    sql_on: ${catalog_item.catalog_object_id} = ${catalog_item_variation.item_id} ;;
    relationship: one_to_many
  }
  join: item_variation_location_override {
    view_label: "Catalog"
    type: left_outer
    sql_on: ${catalog_item_variation.item_id} = ${item_variation_location_override.item_id} ;;
    relationship: many_to_one
  }
  join: catalog_item_tax {
    view_label: "Catalog"
    type: left_outer
    sql_on: ${catalog_item.catalog_object_id} = ${catalog_item_tax.catalog_item_id} ;;
    relationship: one_to_one
    fields: []
  }
  join: catalog_tax {
    view_label: "Catalog"
    type: left_outer
    sql_on: ${catalog_object.id} = ${catalog_tax.catalog_object_id} ;;
    relationship: one_to_one
  }
  join: catalog_modifier {
    view_label: "Catalog"
    type: left_outer
    sql_on: ${catalog_object.id} = ${catalog_modifier.catalog_object_id} ;;
    relationship: one_to_one
  }
  join: catalog_category {
    view_label: "Catalog"
    type: left_outer
    sql_on: ${catalog_object.id} = ${catalog_category.catalog_object_id} ;;
    relationship: one_to_one
  }
  join: catalog_discount {
    view_label: "Catalog"
    type: left_outer
    sql_on: ${catalog_object.id} = ${catalog_discount.catalog_object_id} ;;
    relationship: one_to_one
  }
  join: catalog_modifier_in_catalog_modifier_list {
    view_label: "Catalog"
    type: left_outer
    sql_on: ${catalog_modifier.catalog_object_id} = ${catalog_modifier_in_catalog_modifier_list.catalog_modifier} ;;
    relationship: one_to_one
    fields: []
  }
  join: catalog_modifier_list {
    view_label: "Catalog"
    type: left_outer
    sql_on: ${catalog_object.id} = ${catalog_modifier_list.catalog_object_id} ;;
    relationship: one_to_one
  }
  join: catalog_item_modifier_list_info {
    view_label: "Catalog"
    type: left_outer
    sql_on: ${catalog_item.catalog_object_id} = ${catalog_item_modifier_list_info.catalog_item_id} ;;
    relationship: one_to_one
  }
  join: catalog_item_modifier_override {
    view_label: "Catalog"
    type: left_outer
    sql_on: ${catalog_modifier.catalog_object_id} = ${catalog_item_modifier_override.modifier_id} ;;
    relationship: one_to_one
  }
}







# explore: additional_recipient_receivable {
#   join: transaction {
#     type: left_outer
#     sql_on: ${additional_recipient_receivable.transaction_id} = ${transaction.id} ;;
#     relationship: many_to_one
#   }

#   join: order {
#     type: left_outer
#     sql_on: ${transaction.order_id} = ${order.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: additional_recipient_receivable_refund {
#   join: refund {
#     type: left_outer
#     sql_on: ${additional_recipient_receivable_refund.refund_id} = ${refund.id} ;;
#     relationship: many_to_one
#   }

#   join: transaction {
#     type: left_outer
#     sql_on: ${refund.transaction_id} = ${transaction.id} ;;
#     relationship: many_to_one
#   }

#   join: tender {
#     type: left_outer
#     sql_on: ${refund.tender_id} = ${tender.id} ;;
#     relationship: many_to_one
#   }

#   join: order {
#     type: left_outer
#     sql_on: ${refund.order_id} = ${order.id} ;;
#     relationship: many_to_one
#   }

#   join: customer {
#     type: left_outer
#     sql_on: ${tender.customer_id} = ${customer.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: additional_recipient_refund {
#   join: refund {
#     type: left_outer
#     sql_on: ${additional_recipient_refund.refund_id} = ${refund.id} ;;
#     relationship: many_to_one
#   }

#   join: transaction {
#     type: left_outer
#     sql_on: ${refund.transaction_id} = ${transaction.id} ;;
#     relationship: many_to_one
#   }

#   join: tender {
#     type: left_outer
#     sql_on: ${refund.tender_id} = ${tender.id} ;;
#     relationship: many_to_one
#   }

#   join: order {
#     type: left_outer
#     sql_on: ${refund.order_id} = ${order.id} ;;
#     relationship: many_to_one
#   }

#   join: customer {
#     type: left_outer
#     sql_on: ${tender.customer_id} = ${customer.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: break_type {}

# explore: card {}

# explore: catalog_discount {
#   join: catalog_object {
#     type: left_outer
#     sql_on: ${catalog_discount.catalog_object_id} = ${catalog_object.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: catalog_item {
#   join: catalog_object {
#     type: left_outer
#     sql_on: ${catalog_item.catalog_object_id} = ${catalog_object.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: catalog_item_modifier_list_info {}

# explore: catalog_item_modifier_override {}

# explore: catalog_item_tax {}

# explore: catalog_location {
#   join: catalog_object {
#     type: left_outer
#     sql_on: ${catalog_location.catalog_object_id} = ${catalog_object.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: catalog_modifier {
#   join: catalog_object {
#     type: left_outer
#     sql_on: ${catalog_modifier.catalog_object_id} = ${catalog_object.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: catalog_modifier_in_catalog_modifier_list {}

# explore: catalog_modifier_list {
#   join: catalog_object {
#     type: left_outer
#     sql_on: ${catalog_modifier_list.catalog_object_id} = ${catalog_object.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: catalog_object {}

# explore: catalog_tax {
#   join: catalog_object {
#     type: left_outer
#     sql_on: ${catalog_tax.catalog_object_id} = ${catalog_object.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: customer {}

# explore: customer_card {
#   join: customer {
#     type: left_outer
#     sql_on: ${customer_card.customer_id} = ${customer.id} ;;
#     relationship: many_to_one
#   }

#   join: card {
#     type: left_outer
#     sql_on: ${customer_card.card_id} = ${card.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: customer_group_association {
#   join: customer {
#     type: left_outer
#     sql_on: ${customer_group_association.customer_id} = ${customer.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: customer_group_info {}

# explore: employee {}

# explore: employee_location {
#   join: employee {
#     type: left_outer
#     sql_on: ${employee_location.employee_id} = ${employee.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: employee_wage {
#   join: employee {
#     type: left_outer
#     sql_on: ${employee_wage.employee_id} = ${employee.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: inventory_count_history {
#   join: catalog_object {
#     type: left_outer
#     sql_on: ${inventory_count_history.catalog_object_id} = ${catalog_object.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: order_fulfillment {
#   join: catalog_object {
#     type: left_outer
#     sql_on: ${order_fulfillment.catalog_object_id} = ${catalog_object.id} ;;
#     relationship: many_to_one
#   }

#   join: order {
#     type: left_outer
#     sql_on: ${order_fulfillment.order_id} = ${order.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: order_line_item {
#   join: catalog_object {
#     type: left_outer
#     sql_on: ${order_line_item.catalog_object_id} = ${catalog_object.id} ;;
#     relationship: many_to_one
#   }

#   join: order {
#     type: left_outer
#     sql_on: ${order_line_item.order_id} = ${order.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: order_line_item_modifier {
#   join: catalog_object {
#     type: left_outer
#     sql_on: ${order_line_item_modifier.catalog_object_id} = ${catalog_object.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: order_line_item_tax {
#   join: catalog_object {
#     type: left_outer
#     sql_on: ${order_line_item_tax.catalog_object_id} = ${catalog_object.id} ;;
#     relationship: many_to_one
#   }

#   join: order {
#     type: left_outer
#     sql_on: ${order_line_item_tax.order_id} = ${order.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: order_return {}

# explore: order_return_line_item {
#   join: catalog_object {
#     type: left_outer
#     sql_on: ${order_return_line_item.catalog_object_id} = ${catalog_object.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: order_return_line_item_modifier {
#   join: catalog_object {
#     type: left_outer
#     sql_on: ${order_return_line_item_modifier.catalog_object_id} = ${catalog_object.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: order_service_charge {
#   join: catalog_object {
#     type: left_outer
#     sql_on: ${order_service_charge.catalog_object_id} = ${catalog_object.id} ;;
#     relationship: many_to_one
#   }

#   join: order {
#     type: left_outer
#     sql_on: ${order_service_charge.order_id} = ${order.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: refund {
#   join: transaction {
#     type: left_outer
#     sql_on: ${refund.transaction_id} = ${transaction.id} ;;
#     relationship: many_to_one
#   }

#   join: tender {
#     type: left_outer
#     sql_on: ${refund.tender_id} = ${tender.id} ;;
#     relationship: many_to_one
#   }

#   join: order {
#     type: left_outer
#     sql_on: ${refund.order_id} = ${order.id} ;;
#     relationship: many_to_one
#   }

#   join: customer {
#     type: left_outer
#     sql_on: ${tender.customer_id} = ${customer.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: tender {
#   join: transaction {
#     type: left_outer
#     sql_on: ${tender.transaction_id} = ${transaction.id} ;;
#     relationship: many_to_one
#   }

#   join: customer {
#     type: left_outer
#     sql_on: ${tender.customer_id} = ${customer.id} ;;
#     relationship: many_to_one
#   }

#   join: order {
#     type: left_outer
#     sql_on: ${tender.order_id} = ${order.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: tender_additional_recipient {
#   join: tender {
#     type: left_outer
#     sql_on: ${tender_additional_recipient.tender_id} = ${tender.id} ;;
#     relationship: many_to_one
#   }

#   join: transaction {
#     type: left_outer
#     sql_on: ${tender.transaction_id} = ${transaction.id} ;;
#     relationship: many_to_one
#   }

#   join: customer {
#     type: left_outer
#     sql_on: ${tender.customer_id} = ${customer.id} ;;
#     relationship: many_to_one
#   }

#   join: order {
#     type: left_outer
#     sql_on: ${tender.order_id} = ${order.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: transaction {
#   join: order {
#     type: left_outer
#     sql_on: ${transaction.order_id} = ${order.id} ;;
#     relationship: many_to_one
#   }
# }

explore: workweek_history {}
