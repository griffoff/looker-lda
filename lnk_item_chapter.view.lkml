include: "base.lnk_base.view.lkml"
view: lnk_item_chapter {
  extends: [lnk_base]

  sql_table_name: DATAVAULT.LNK_ITEM_CHAPTER ;;

  dimension: chapter_hash {
    type: string
    sql: ${TABLE}."CHAPTER_HASH" ;;
  }

  dimension: item_chapter_hash {
    type: string
    sql: ${TABLE}."ITEM_CHAPTER_HASH" ;;
  }

  dimension: item_hash {
    type: string
    sql: ${TABLE}."ITEM_HASH" ;;
  }

}
