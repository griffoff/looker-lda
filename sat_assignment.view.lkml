include:"base.sat_base.view.lkml"

explore: sat_assignment {}

view: sat_assignment {
  extends: [sat_base]
  sql_table_name: DATAVAULT.SAT_ASSIGNMENT ;;

  set: set_details {fields:[assignmentname]}

  dimension: assignment_hash {
    type: string
    sql: ${TABLE}."ASSIGNMENT_HASH" ;;
  }

  dimension: assignmentname {
    type: string
    sql: ${TABLE}."ASSIGNMENTNAME" ;;
  }
}
