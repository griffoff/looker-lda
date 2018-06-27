view: lipson_weekly_united {
  sql_table_name: FIVETRAN_CNOW_CXP_ANALYSIS.WEEKLY_DATA ;;

  dimension: _fivetran_deleted {
    type: yesno
    sql: ${TABLE}."_FIVETRAN_DELETED" ;;
  }

  dimension: _fivetran_index {
    type: number
    sql: ${TABLE}."_FIVETRAN_INDEX" ;;
    hidden: yes
  }

  dimension_group: _fivetran_synced {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."_FIVETRAN_SYNCED" ;;
  }

  dimension: avgscore {
    type: number
    sql: ${TABLE}."AVGSCORE" ;;
  }

  dimension: itemname {
    type: string
    sql: ${TABLE}."ITEMNAME" ;;
  }

  dimension: ntakes {
    type: number
    sql: ${TABLE}."NTAKES" ;;
  }

  dimension: productcode {
    type: string
    sql: ${TABLE}."PRODUCTCODE" ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}."SOURCE" ;;
  }

  dimension_group: weekstart {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."WEEKSTART" ;;
  }

  dimension: ntakes_times_avgscore {
    type: number
    sql: ${TABLE}."NTAKES" * ${TABLE}."AVGSCORE" ;;
    hidden:  yes
  }

  measure: count {
    type: count
    drill_fields: [itemname]
  }

  measure: total_ntakes_times_avgscore {
    type: sum
    sql: ${ntakes_times_avgscore} ;;
    hidden: yes
  }

  measure: total_takes {
    type: sum
    sql: ${ntakes} ;;
  }

  measure: average_score {
    type: number
    sql: ${total_ntakes_times_avgscore} / ${total_takes};;
  }

}
