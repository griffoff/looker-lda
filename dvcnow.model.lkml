connection: "snowflake_lda"

include: "*.view.lkml"         # include all views in this project
include: "*.dashboard.lookml"  # include all dashboards in this project

explore: cxp_sat_take {
  label: "Direct_ProductCode-ItemID-Report"
  description: "Returns ProductCodes and ItemIDs with abnormally low average scores using existing tables"
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
  group_label: "CXP Low Score Reports"
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
  label: "Derived_ProductCode-ItemID-Report"
  description: "Returns ProductCodes and ItemIDs with abnormally low average scores using derived table"
  group_label: "CXP Low Score Reports"
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

explore: cxp_course {
  label: "Derived_Course-Report"
  description: "Returns CourseKeys with abnormally low average scores using derived table"
  group_label: "CXP Low Score Reports"
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

explore: lipson_submissions_weekly {
  group_label: "Lipson Low Score Reports"
  label: "CXP Submissions Report"
  description: "Using table Submissions"
 join: lipson_disciplines {
  relationship: many_to_one
  sql_on: ${lipson_disciplines.productcode} = ${lipson_submissions_weekly.productcode} ;;
  }
 join: lipson_item_types {
  type: inner
   relationship: many_to_one
   sql_on: ${lipson_item_types.productcode}= ${lipson_submissions_weekly.productcode}
        AND ${lipson_item_types.itemname} = ${lipson_submissions_weekly.itemname} ;;
  }
  always_filter: {
    filters: {
      field: lipson_disciplines._fivetran_deleted
      value: "No"
    }
    filters: {
      field: lipson_item_types._fivetran_deleted
      value: "No"
    }
  }
}

explore: lipson_weekly_data_cxp {
  group_label: "Lipson Low Score Reports"
  label: "CXP Weekly Report"
  description: "Using table Weekly_Data_CXP"
  sql_always_where: ${_fivetran_deleted}='No' AND ${_fivetran_index} is not NULL;;
  join: lipson_disciplines {
    relationship: many_to_one
    sql_on: ${lipson_disciplines.productcode} = ${lipson_weekly_data_cxp.productcode} ;;
  }
  join: lipson_item_types {
    type: inner
    relationship: many_to_one
    sql_on: ${lipson_item_types.productcode}= ${lipson_weekly_data_cxp.productcode}
      AND ${lipson_item_types.itemname} = ${lipson_weekly_data_cxp.itemname} ;;
  }
  always_filter: {
    filters: {
      field: lipson_disciplines._fivetran_deleted
      value: "No"
    }
    filters: {
      field: lipson_item_types._fivetran_deleted
      value: "No"
    }
  }
}

explore: lipson_united {
  group_label: "Lipson Low Score Reports"
  label: "United Data Report"
  description: "Using tables Submissions and Submissions_CNOW"
  join: lipson_disciplines {
    relationship: many_to_one
    sql_on: ${lipson_disciplines.productcode} = ${lipson_united.productcode} ;;
  }
  join: lipson_item_types {
    type: inner
    relationship: many_to_one
    sql_on: ${lipson_item_types.productcode}= ${lipson_united.productcode}
      AND ${lipson_item_types.itemname} = ${lipson_united.itemname} ;;
  }
  always_filter: {
    filters: {
      field: lipson_disciplines._fivetran_deleted
      value: "No"
    }
    filters: {
      field: lipson_item_types._fivetran_deleted
      value: "No"
    }
  }
 }

explore: lipson_weekly_united {
  group_label: "Lipson Low Score Reports"
  label: "United Weelky Report"
  description: "Using table Weekly_Data"
 sql_always_where: ${_fivetran_deleted}='No' ;;
  join: lipson_disciplines {
    relationship: many_to_one
  sql_on: ${lipson_disciplines.productcode} = ${lipson_weekly_united.productcode} ;;
  }
  join: lipson_item_types {
    type: inner
    relationship: many_to_one
    sql_on: ${lipson_item_types.productcode}= ${lipson_weekly_united.productcode}
      AND ${lipson_item_types.itemname} = ${lipson_weekly_united.itemname} ;;
  }
#  always_filter: {
#    filters: {
#      field: lipson_disciplines._fivetran_deleted
#      value: "No"
#    }
#    filters: {
#      field: lipson_item_types._fivetran_deleted
#      value: "No"
#    }
#  }
}
