include: "base.hub_base.view.lkml"
view: hub_attempt {
  extends: [hub_base]
  sql_table_name: DATAVAULT.HUB_ATTEMPT ;;

  dimension: attempt {
    type: string
    sql: ${TABLE}."ATTEMPT" ;;
  }

  dimension: attempt_hash {
    type: string
    sql: ${TABLE}."ATTEMPT_HASH" ;;
  }

}
