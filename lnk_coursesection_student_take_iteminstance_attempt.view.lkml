include: "base.lnk_base.view.lkml"
view: lnk_coursesection_student_take_iteminstance_attempt {
  extends: [lnk_base]

  sql_table_name: DATAVAULT.LNK_COURSESECTION_STUDENT_TAKE_ITEMINSTANCE_ATTEMPT ;;

  dimension: attempt_hash {
    type: string
    sql: ${TABLE}."ATTEMPT_HASH" ;;
  }

  dimension: coursesection_hash {
    type: string
    sql: ${TABLE}."COURSESECTION_HASH" ;;
  }

  dimension: coursesection_student_take_iteminstance_attempt_hash {
    type: string
    sql: ${TABLE}."COURSESECTION_STUDENT_TAKE_ITEMINSTANCE_ATTEMPT_HASH" ;;
  }

  dimension: iteminstance_hash {
    type: string
    sql: ${TABLE}."ITEMINSTANCE_HASH" ;;
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
