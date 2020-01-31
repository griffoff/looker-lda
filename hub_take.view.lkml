include: "base.hub_base.view.lkml"
view: hub_take {
  extends: [hub_base]
  sql_table_name: DATAVAULT.HUB_TAKE ;;

  dimension: source {
    type: string
    sql: ${TABLE}."SOURCE" ;;
  }

  dimension: take {
    type: string
    sql: ${TABLE}."TAKE" ;;
  }

  dimension: take_hash {
    type: string
    sql: ${TABLE}."TAKE_HASH" ;;
  }

}
