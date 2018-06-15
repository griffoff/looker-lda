connection: "snowflake_lda"

include: "*.view.lkml"         # include all views in this project
include: "*.dashboard.lookml"  # include all dashboards in this project

include: "/core/common.lkml"


explore: sat_take {
  join: lnk_take {
    sql_on:  ${sat_take.lnk_takehash} = ${lnk_take.lnk_takehash};;
    relationship: many_to_one
  }
}
