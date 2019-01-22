connection: "snowflake_lda"

include: "*.view.lkml"         # include all views in this project
#include: "*.dashboard.lookml"  # include all dashboards in this project

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
# explore: cxp_hub_assignment {}
# explore: cxp_hub_course {}
# explore: cxp_hub_cxpuser {}
# explore: cxp_hub_itemid {}
# explore: cxp_hub_node{}
# explore: cxp_hub_productcode {}
# explore: cxp_hub_take {}

#explore: cxp_sat_take {}

# explore: cxp_sat_take {
#   join: cxp_lnk_take {
#     relationship: many_to_one
#     sql_on: ${cxp_lnk_take.lnk_takehash} = ${cxp_sat_take.lnk_takehash} ;;
#   }
#   join: cxp_hub_productcode {
#     relationship: many_to_one
#     sql_on: ${cxp_hub_productcode.productcodehash} = ${cxp_lnk_take.productcodehash} ;;
#   }
#   group_label: "Low_Score_Product"
# }


explore: mt_vs_ga {
  label: "Lex_us"
}

explore: interaction_ga_vs_mt_201807 {
  label: "Lex_us_2018_07"
}

explore: testc {
  label: "Lex_us_2018_12_25"
}

explore: raw_olr_provisioned_product {
  sql_always_where: ${excluded_users.user_sso_guid} is NULL  ;;
  join : excluded_users {
    type: left_outer
    relationship: many_to_one
    sql_on: ${excluded_users.user_sso_guid} = ${raw_olr_provisioned_product.user_sso_guid} ;;
    #sql_where: ${excluded_users.user_sso_guid} is NULL  ;;


  }
  group_label: "DVCNOW"
  #label: "BNOC_Product"
}
