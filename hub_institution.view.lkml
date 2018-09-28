include: "base.hub_base.view.lkml"
view: hub_institution {
  extends: [hub_base]
  sql_table_name: DATAVAULT.HUB_INSTITUTION ;;

  dimension: institution {
    type: string
    sql: ${TABLE}."INSTITUTION" ;;
  }

  dimension: institution_hash {
    type: string
    sql: ${TABLE}."INSTITUTION_HASH" ;;
  }

}
