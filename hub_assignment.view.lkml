include: "base.hub_base.view.lkml"

explore: hub_assignment {}

view: hub_assignment {
  extends: [hub_base]
  sql_table_name: DATAVAULT.HUB_ASSIGNMENT ;;

  dimension: assignment {
    type: string
    sql: ${TABLE}."ASSIGNMENT" ;;
  }

  dimension: assignment_hash {
    type: string
    sql: ${TABLE}."ASSIGNMENT_HASH" ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}."SOURCE" ;;
  }

}
