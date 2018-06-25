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

explore: l {
  group_label: "Lipson Low Score Reports"
  label: "Discipline ProblemType FieldType Report"
# join: lipson_disciplines {
#    relationship: many_to_one
#    sql_on: ${lipson_disciplines.productcode} = ${lipson_weekly_aggregation.productcode} AND ${lipson_disciplines._fivetran_deleted} = FALSE ;;
#  }
}
