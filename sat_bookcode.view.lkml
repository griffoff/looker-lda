include:"base.sat_base.view.lkml"
view: sat_bookcode {
  extends: [sat_base]
  sql_table_name: DATAVAULT.SAT_BOOKCODE ;;

  set: set_details {fields:[isbn, name]}

  dimension: bookcode_hash {
    type: string
    sql: ${TABLE}."BOOKCODE_HASH" ;;
  }

  dimension: discipline {
    type: string
    sql: ${TABLE}."DISCIPLINE" ;;
  }

  dimension: isbn {
    type: string
    sql: ${TABLE}."ISBN" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."NAME" ;;
  }

}
