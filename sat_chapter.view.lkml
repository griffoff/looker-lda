include:"base.sat_base.view.lkml"
view: sat_chapter {
  extends: [sat_base]
  sql_table_name: DATAVAULT.SAT_CHAPTER ;;

  set: set_details {fields:[chapternumber, chaptername]}

  dimension: chapter_hash {
    type: string
    sql: ${TABLE}."CHAPTER_HASH" ;;
  }

  dimension: chaptername {
    type: string
    sql: ${TABLE}."CHAPTERNAME" ;;
  }

  dimension: chapternumber {
    type: number
    sql: ${TABLE}."CHAPTERNUMBER" ;;
  }

}
