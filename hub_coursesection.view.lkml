include: "base.hub_base.view.lkml"
view: hub_coursesection {
  extends: [hub_base]
  sql_table_name: DATAVAULT.HUB_COURSESECTION ;;

  dimension: coursesection {
    type: string
    sql: ${TABLE}."COURSESECTION" ;;
  }

  dimension: coursesection_hash {
    type: string
    sql: ${TABLE}."COURSESECTION_HASH" ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}."SOURCE" ;;
  }

}
