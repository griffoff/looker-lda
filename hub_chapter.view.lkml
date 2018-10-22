include: "base.hub_base.view.lkml"
view: hub_chapter {
  extends: [hub_base]
  sql_table_name: DATAVAULT.HUB_CHAPTER ;;

  dimension: chapter_hash {
    type: string
    sql: ${TABLE}."CHAPTER_HASH" ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}."SOURCE" ;;
  }

  dimension: take {
    type: string
    sql: ${TABLE}."TAKE" ;;
  }

}
