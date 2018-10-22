include: "base.lnk_base.view.lkml"
view: lnk_assignment_item {
  extends: [lnk_base]
  sql_table_name: DATAVAULT.LNK_ASSIGNMENT_ITEM ;;

  dimension: assignment_hash {
    type: string
    sql: ${TABLE}."ASSIGNMENT_HASH" ;;
  }

  dimension: assignment_item_hash {
    type: string
    sql: ${TABLE}."ASSIGNMENT_ITEM_HASH" ;;
  }

  dimension: item_hash {
    type: string
    sql: ${TABLE}."ITEM_HASH" ;;
  }

}
