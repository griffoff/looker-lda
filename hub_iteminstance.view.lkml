include: "base.hub_base.view.lkml"
view: hub_iteminstance {
  extends: [hub_base]
  sql_table_name: DATAVAULT.HUB_ITEMINSTANCE ;;

  dimension: iteminstance {
    type: string
    sql: ${TABLE}."ITEMINSTANCE" ;;
  }

  dimension: iteminstance_hash {
    type: string
    sql: ${TABLE}."ITEMINSTANCE_HASH" ;;
  }

}
