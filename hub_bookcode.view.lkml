include: "base.hub_base.view.lkml"
view: hub_bookcode {
  extends: [hub_base]
  sql_table_name: DATAVAULT.HUB_BOOKCODE ;;

  dimension: bookcode {
    type: string
    sql: ${TABLE}."BOOKCODE" ;;
  }

  dimension: bookcode_hash {
    type: string
    sql: ${TABLE}."BOOKCODE_HASH" ;;
  }

}
