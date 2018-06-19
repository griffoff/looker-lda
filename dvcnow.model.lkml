connection: "snowflake_lda"

include: "*.view.lkml"         # include all views in this project
include: "*.dashboard.lookml"  # include all dashboards in this project

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# explore: order_items {
#   join: orders {
#     relationship: many_to_one
#     sql_on: ${orders.id} = ${order_items.order_id} ;;
#   }
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
# }
explore: cxp_hub_assignment {}
explore: cxp_hub_course {}
explore: cxp_hub_cxpuser {}
explore: cxp_hub_itemid {}
explore: cxp_hub_node{}
explore: cxp_hub_productcode {}
explore: cxp_hub_take {}
explore: cxp_sat_take {}

explore: low_product {
  from: cxp_sat_take
}
