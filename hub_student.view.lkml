include: "base.hub_base.view.lkml"
view: hub_student {
  extends: [hub_base]
  sql_table_name: DATAVAULT.HUB_STUDENT ;;

  dimension: student {
    type: string
    sql: ${TABLE}."STUDENT" ;;
  }

  dimension: student_hash {
    type: string
    sql: ${TABLE}."STUDENT_HASH" ;;
  }

}
