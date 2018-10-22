include: "base.lnk_base.view.lkml"
view: lnk_coursesection_student_take_assignment_attempt {
  extends: [lnk_base]

  sql_table_name: DATAVAULT.LNK_COURSESECTION_STUDENT_TAKE_ASSIGNMENT_ATTEMPT ;;

  dimension: assignment_hash {
    type: string
    sql: ${TABLE}."ASSIGNMENT_HASH" ;;
  }

  dimension: attempt_hash {
    type: string
    sql: ${TABLE}."ATTEMPT_HASH" ;;
  }

  dimension: coursesection_hash {
    type: string
    sql: ${TABLE}."COURSESECTION_HASH" ;;
  }

  dimension: coursesection_student_take_assignment_attempt_hash {
    type: string
    sql: ${TABLE}."COURSESECTION_STUDENT_TAKE_ASSIGNMENT_ATTEMPT_HASH" ;;
  }

  dimension: student_hash {
    type: string
    sql: ${TABLE}."STUDENT_HASH" ;;
  }

  dimension: take_hash {
    type: string
    sql: ${TABLE}."TAKE_HASH" ;;
  }

}
