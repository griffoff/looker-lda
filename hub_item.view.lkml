include: "base.hub_base.view.lkml"
view: hub_item {
  extends: [hub_base]
  sql_table_name: DATAVAULT.HUB_ITEM ;;

  dimension: item {
    type: string
    sql: ${TABLE}."ITEM" ;;
  }

  dimension: item_hash {
    type: string
    sql: ${TABLE}."ITEM_HASH" ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}."SOURCE" ;;
  }

}
