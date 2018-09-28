include: "base.hub_base.view.lkml"
view: hub_product {
  extends: [hub_base]
  sql_table_name: DATAVAULT.HUB_PRODUCT ;;

  dimension: product {
    type: string
    sql: ${TABLE}."PRODUCT" ;;
  }

  dimension: product_hash {
    type: string
    sql: ${TABLE}."PRODUCT_HASH" ;;
  }

}
