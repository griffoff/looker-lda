connection: "snowflake_lda"

label: "Data from Mark Lipson's MySQL"

# include: "*.view.lkml"         # include all views in this project
# include: "*.dashboard.lookml"  # include all dashboards in this project
#include: "/core/common.lkml"

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

# explore: submissions {
#
# }
#
# explore: weekly_data_union {
#   join: item_types {
#     sql_on: ${weekly_data_union.productcode}=${item_types.productcode} and ${weekly_data_union.itemname}=${item_types.itemname} ;;
#     relationship: many_to_one
#   }
#   join: disciplines {
#     sql_on: ${weekly_data_union.productcode}=${disciplines.productcode}  ;;
#     relationship: many_to_one
#   }
# }
#
# #explore: fivetran_audit {}
#
# explore:  hub_book{}
