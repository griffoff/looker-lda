view: testc {
  sql_table_name: DELETE_DVTEST.TESTC ;;

  dimension: category {
    type: string
    sql: ${TABLE}."CATEGORY" ;;
  }

  dimension: ga_event {
    type: string
    sql: ${TABLE}."GA_EVENT" ;;
  }

  dimension: ga_eventaction {
    type: string
    sql: ${TABLE}."GA_EVENTACTION" ;;
  }

  dimension: ga_fullvisitorid {
    type: string
    sql: ${TABLE}."GA_FULLVISITORID" ;;
  }

  dimension_group: ga_totals_timeonsite {
    type: time
    timeframes: [
      raw,
      time,
      minute
    ]
    sql: ${TABLE}."GA_TOTALS_TIMEONSITE" ;;
  }

  dimension: mt_event_action {
    type: string
    sql: ${TABLE}."MT_EVENT_ACTION" ;;
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
      minute10
    ]
    sql: ${TABLE}."TIME" ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}."USER_ID" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
