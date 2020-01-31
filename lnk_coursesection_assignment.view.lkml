include: "base.lnk_base.view.lkml"
view: lnk_coursesection_assignment {
  extends: [lnk_base]

  sql_table_name: DATAVAULT.LNK_COURSESECTION_ASSIGNMENT ;;

  dimension: assignment_hash {
    type: string
    sql: ${TABLE}."ASSIGNMENT_HASH" ;;
  }

  dimension: coursesection_assignment_hash {
    type: string
    sql: ${TABLE}."COURSESECTION_ASSIGNMENT_HASH" ;;
  }

  dimension: coursesection_hash {
    type: string
    sql: ${TABLE}."COURSESECTION_HASH" ;;
  }

}
