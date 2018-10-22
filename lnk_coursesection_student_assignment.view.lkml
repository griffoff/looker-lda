include: "base.lnk_base.view.lkml"
view: lnk_coursesection_student_assignment {
  extends: [lnk_base]

  sql_table_name: DATAVAULT.LNK_COURSESECTION_STUDENT_ASSIGNMENT ;;

  dimension: assignment_hash {
    type: string
    sql: ${TABLE}."ASSIGNMENT_HASH" ;;
  }

  dimension: coursesection_hash {
    type: string
    sql: ${TABLE}."COURSESECTION_HASH" ;;
  }

  dimension: coursesection_student_assignment_hash {
    type: string
    sql: ${TABLE}."COURSESECTION_STUDENT_ASSIGNMENT_HASH" ;;
  }

  dimension: student_hash {
    type: string
    sql: ${TABLE}."STUDENT_HASH" ;;
  }

}
