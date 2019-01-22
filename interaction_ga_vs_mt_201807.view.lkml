view: interaction_ga_vs_mt_201807 {
  sql_table_name: DELETE_DVTEST.INTERACTION_GA_VS_MT_201807 ;;

  dimension: category {
    type: string
    sql: ${TABLE}."CATEGORY" ;;
  }

  dimension: fullvisitorid {
    type: string
    sql: ${TABLE}."FULLVISITORID" ;;
  }

  dimension: ga_event {
    type: string
    sql: ${TABLE}."GA_EVENT" ;;
  }

  dimension: src {
    type: string
    sql: ${TABLE}."SRC" ;;
  }

  dimension_group: time {
    type: time
    timeframes: [
      raw,
      time,
      date,
      day_of_month,
      day_of_week_index,
      day_of_week
    ]
    sql: ${TABLE}."TIME" ;;
  }

  dimension_group: timeonsite {
    type: time
    timeframes: [
      raw,
      time,
      minute
    ]
    sql: ${TABLE}."TIMEONSITE" ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}."USER_ID" ;;
  }

  dimension: visitnumber {
    type: string
    sql: ${TABLE}."VISITNUMBER" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
