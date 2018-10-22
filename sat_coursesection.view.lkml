include:"base.sat_base.view.lkml"
view: sat_coursesection {
  extends: [sat_base]
  sql_table_name: DATAVAULT.SAT_COURSESECTION ;;

  set: set_details {fields:[startdate_date, enddate_date]}

  dimension: coursesection_hash {
    type: string
    sql: ${TABLE}."COURSESECTION_HASH" ;;
  }

  dimension_group: enddate {
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
    sql: ${TABLE}."ENDDATE" ;;
  }

  dimension_group: startdate {
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
    sql: ${TABLE}."STARTDATE" ;;
  }

}
