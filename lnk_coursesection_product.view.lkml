include: "base.lnk_base.view.lkml"
view: lnk_coursesection_product {
  extends: [lnk_base]

  sql_table_name: DATAVAULT.LNK_COURSESECTION_PRODUCT ;;

  dimension: coursesection_hash {
    type: string
    sql: ${TABLE}."COURSESECTION_HASH" ;;
  }

  dimension: coursesection_product_hash {
    type: string
    sql: ${TABLE}."COURSESECTION_PRODUCT_HASH" ;;
  }

  dimension: product_hash {
    type: string
    sql: ${TABLE}."PRODUCT_HASH" ;;
  }

}
