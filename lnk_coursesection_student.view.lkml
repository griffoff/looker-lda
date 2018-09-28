include: "base.lnk_base.view.lkml"
view: lnk_coursesection_student {
  extends: [lnk_base]

  sql_table_name: DATAVAULT.LNK_COURSESECTION_STUDENT ;;

  dimension: coursesection_hash {
    type: string
    sql: ${TABLE}."COURSESECTION_HASH" ;;
  }

  dimension: coursesection_student_hash {
    type: string
    sql: ${TABLE}."COURSESECTION_STUDENT_HASH" ;;
  }

  dimension: student_hash {
    type: string
    sql: ${TABLE}."STUDENT_HASH" ;;
  }

}
