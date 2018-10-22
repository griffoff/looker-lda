include: "base.lnk_base.view.lkml"
view: lnk_iteminstance_bookcode {
  extends: [lnk_base]

  sql_table_name: DATAVAULT.LNK_ITEMINSTANCE_BOOKCODE ;;

  dimension: bookcode_hash {
    type: string
    sql: ${TABLE}."BOOKCODE_HASH" ;;
  }

  dimension: iteminstance_bookcode_hash {
    type: string
    sql: ${TABLE}."ITEMINSTANCE_BOOKCODE_HASH" ;;
  }

  dimension: iteminstance_hash {
    type: string
    sql: ${TABLE}."ITEMINSTANCE_HASH" ;;
  }

}
