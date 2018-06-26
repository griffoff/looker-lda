view: lipson_weekly_data_cxp {
  sql_table_name: FIVETRAN_CNOW_CXP_ANALYSIS.WEEKLY_DATA_CXP ;;

  dimension: _fivetran_deleted {
    type: yesno
    sql: ${TABLE}._FIVETRAN_DELETED ;;
  }

  dimension: _fivetran_id {
    type: string
    sql: ${TABLE}._FIVETRAN_ID ;;
    hidden: yes
  }

  dimension: _fivetran_index {
    type: number
    sql: ${TABLE}._FIVETRAN_INDEX ;;
    hidden: yes
  }

  dimension_group: _fivetran_synced {
    type: time
    sql: ${TABLE}._FIVETRAN_SYNCED ;;
    #hidden: yes
  }

  dimension: avgscore {
    type: number
    sql: ${TABLE}.AVGSCORE ;;
  }

  dimension: itemname {
    type: string
    sql: ${TABLE}.ITEMNAME ;;
  }

  dimension: ntakes {
    type: number
    sql: ${TABLE}.NTAKES ;;
  }

  dimension: productcode {
    type: string
    sql: ${TABLE}.PRODUCTCODE ;;
  }

  dimension: ntakes_times_avgscore {
    type: number
    sql: ${TABLE}."NTAKES" * ${TABLE}."AVGSCORE" ;;
    hidden:  yes
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
    sql: ${TABLE}.WEEKSTART ;;
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
