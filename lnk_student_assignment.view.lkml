include: "base.lnk_base.view.lkml"
view: lnk_student_assignment {
  extends: [lnk_base]

  sql_table_name: DATAVAULT.LNK_STUDENT_ASSIGNMENT ;;

  dimension: assignment_hash {
    type: string
    sql: ${TABLE}."ASSIGNMENT_HASH" ;;
  }

  dimension: student_assignment_hash {
    type: string
    sql: ${TABLE}."STUDENT_ASSIGNMENT_HASH" ;;
  }

  dimension: student_hash {
    type: string
    sql: ${TABLE}."STUDENT_HASH" ;;
  }

}
