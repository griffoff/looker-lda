include: "base.sat_base.view.lkml"
view: sat_coursesection_student_take_iteminstance_attempt {
  extends: [sat_base]
  sql_table_name: DATAVAULT.SAT_COURSESECTION_STUDENT_TAKE_ITEMINSTANCE_ATTEMPT ;;

  set: set_details {fields:[startdatetime_raw, finishdatetime_raw, score, possiblescore]}

  dimension: coursesection_student_take_iteminstance_attempt_hash {
    type: string
    sql: ${TABLE}."COURSESECTION_STUDENT_TAKE_ITEMINSTANCE_ATTEMPT_HASH" ;;
    hidden: yes
  }

  dimension_group: finishdatetime {
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
    sql: ${TABLE}."FINISHDATETIME" ;;
  }

  dimension: possiblescore {
    type: number
    sql: ${TABLE}."POSSIBLESCORE" ;;
  }

  dimension: score {
    type: number
    sql: ${TABLE}."SCORE" ;;
  }

  dimension_group: startdatetime {
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
    sql: ${TABLE}."STARTDATETIME" ;;
  }

  measure: score_avg {
    type: average
    sql: ${score} ;;
    value_format_name: decimal_2
    drill_fields: [set_details*]
  }

  measure: count {
    label: "# Attempts"
    hidden: no
  }

  measure: attempts_avg {
    type: number
    sql: ${count} / nullif(${hub_student.count}, 0) ;;
    value_format_name: decimal_1
  }
}
