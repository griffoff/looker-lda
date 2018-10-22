include: "base.lnk_base.view.lkml"
view: lnk_coursesection_institution {
  extends: [lnk_base]

  sql_table_name: DATAVAULT.LNK_COURSESECTION_INSTITUTION ;;

  dimension: coursesection_hash {
    type: string
    sql: ${TABLE}."COURSESECTION_HASH" ;;
  }

  dimension: coursesection_institution_hash {
    type: string
    sql: ${TABLE}."COURSESECTION_INSTITUTION_HASH" ;;
  }

  dimension: institution_hash {
    type: string
    sql: ${TABLE}."INSTITUTION_HASH" ;;
  }

}
