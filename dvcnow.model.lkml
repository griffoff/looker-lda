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
#explore: cxp_sat_take {}

explore: cxp_sat_take {
  label: "ProductCode-ItemID-Report"
  description: "Returns ProductCodes and ItemIDs with abnormally low average scores"
  fields: [ALL_FIELDS*, -cxp_lnk_take.lnk_takehash, -cxp_lnk_take.takehash, -cxp_lnk_take.assignmenthash, -cxp_lnk_take.count, -cxp_lnk_take.coursekeyhash,
    -cxp_lnk_take.itemidhash, -cxp_lnk_take.cxpuserhash, -cxp_lnk_take.ldts_date, -cxp_lnk_take.ldts_month, -cxp_lnk_take.ldts_quarter, -cxp_lnk_take.ldts_raw,
    -cxp_lnk_take.ldts_time, -cxp_lnk_take.ldts_week, -cxp_lnk_take.ldts_year, -cxp_lnk_take.nodehash, -cxp_lnk_take.productcodehash, -cxp_lnk_take.rsrc]
  join: cxp_lnk_take {
    relationship: many_to_one
    sql_on: ${cxp_lnk_take.lnk_takehash} = ${cxp_sat_take.lnk_takehash} ;;
  }
  join: cxp_hub_productcode {
    relationship: many_to_one
    sql_on: ${cxp_hub_productcode.productcodehash} = ${cxp_lnk_take.productcodehash} ;;
  }
  join: cxp_hub_itemid {
    relationship: many_to_one
    sql_on: ${cxp_hub_itemid.itemidhash} = ${cxp_lnk_take.itemidhash} ;;
  }
  group_label: "Low Score Reports"
  always_filter: {
    filters: {
      field: avg_score
      value: "<= 0.15"
    }
    filters: {
      field: count
      value: ">= 1000"
    }
  }
}

explore: cxp_product_itemid {
  label: "ProductCode-ItemID-Report"
  description: "Returns ProductCodes and ItemIDs with abnormally low average scores"
  group_label: "Low Score Reports"
 # always_filter: {
    #filters: {
      #field: avg_score
      #value: "<= 0.15"
    #}
    #filters: {
      #field: count
      #value: ">= 1000"
    #}
  #}
}
