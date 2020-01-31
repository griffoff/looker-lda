include: "base.hub_base.view.lkml"
view: hub_boxnumber {
  extends: [hub_base]
  sql_table_name: DATAVAULT.HUB_BOXNUMBER ;;

  dimension: boxnumber {
    type: string
    sql: ${TABLE}."BOXNUMBER" ;;
  }

  dimension: boxnumber_hash {
    type: string
    sql: ${TABLE}."BOXNUMBER_HASH" ;;
  }

}
