include: "base.lnk_base.view.lkml"
view: lnk_coursesection_student_item {
  extends: [lnk_base]

  sql_table_name: DATAVAULT.LNK_COURSESECTION_STUDENT_ITEM ;;

  dimension: coursesection_hash {
    type: string
    sql: ${TABLE}."COURSESECTION_HASH" ;;
  }

  dimension: coursesection_student_item_hash {
    type: string
    sql: ${TABLE}."COURSESECTION_STUDENT_ITEM_HASH" ;;
  }

  dimension: item_hash {
    type: string
    sql: ${TABLE}."ITEM_HASH" ;;
  }

  dimension: student_hash {
    type: string
    sql: ${TABLE}."STUDENT_HASH" ;;
  }

}
