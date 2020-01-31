include: "base.lnk_base.view.lkml"
view: lnk_item_iteminstance {
  extends: [lnk_base]

  sql_table_name: DATAVAULT.LNK_ITEM_ITEMINSTANCE ;;

  dimension: item_hash {
    type: string
    sql: ${TABLE}."ITEM_HASH" ;;
  }

  dimension: item_iteminstance_hash {
    type: string
    sql: ${TABLE}."ITEM_ITEMINSTANCE_HASH" ;;
  }

  dimension: iteminstance_hash {
    type: string
    sql: ${TABLE}."ITEMINSTANCE_HASH" ;;
  }

}
