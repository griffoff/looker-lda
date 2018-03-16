view: weekly_data_union {
  extends: [weekly_data_cnow]
#  sql_table_name: FIVETRAN_CNOW_CXP_ANALYSIS.WEEKLY_DATA_CNOW ;;
derived_table: {
    sql: (select 'cxp' source, a1.ITEMNAME, a1.PRODUCTCODE, a1.WEEKSTART, a1.AVGSCORE, a1.NTAKES from FIVETRAN_CNOW_CXP_ANALYSIS.weekly_data_cxp a1) UNION (select 'cnow' source, a2.ITEMNAME, a2.PRODUCTCODE, a2.WEEKSTART, a2.AVGSCORE, a2.NTAKES  from FIVETRAN_CNOW_CXP_ANALYSIS.weekly_data_cnow a2) ;;
}

dimension: source {
}

measure: ntakesum {
  type: sum
  sql: ${ntakes} ;;

}

measure: scoreavg {
  type: number
  sql: sum(${ntakes}*${avgscore})/${ntakesum} ;;
}
#
#   dimension: _fivetran_deleted {
#     type: yesno
#     sql: ${TABLE}._FIVETRAN_DELETED ;;
#   }
#
#   dimension: _fivetran_index {
#     type: number
#     sql: ${TABLE}._FIVETRAN_INDEX ;;
#   }
#
#   dimension: _fivetran_synced {
#     type: string
#     sql: ${TABLE}._FIVETRAN_SYNCED ;;
#   }
#
#   dimension: avgscore {
#     type: number
#     sql: ${TABLE}.AVGSCORE ;;
#   }
#
#   dimension: itemname {
#     type: string
#     sql: ${TABLE}.ITEMNAME ;;
#   }
#
#   dimension: ntakes {
#     type: number
#     sql: ${TABLE}.NTAKES ;;
#   }
#
#   dimension: productcode {
#     type: string
#     sql: ${TABLE}.PRODUCTCODE ;;
#   }
#
#   dimension_group: weekstart {
#     type: time
#     timeframes: [
#       raw,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     convert_tz: no
#     datatype: date
#     sql: ${TABLE}.WEEKSTART ;;
#   }
#
#   measure: count {
#     type: count
#     drill_fields: [itemname]
#   }
}
