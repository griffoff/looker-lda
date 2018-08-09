view: lnk_itemname_productcode {
  sql_table_name: DATAVAULT.LNK_ITEMNAME_PRODUCTCODE ;;

  dimension: itemnamehash {
    type: string
    sql: ${TABLE}."ITEMNAMEHASH" ;;
  }

  dimension: itemnameproductcodehash {
    type: string
    sql: ${TABLE}."ITEMNAMEPRODUCTCODEHASH" ;;
  }

  dimension_group: ldts {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."LDTS" ;;
  }

  dimension: productcodehash {
    type: string
    sql: ${TABLE}."PRODUCTCODEHASH" ;;
  }

  dimension: rsrc {
    type: string
    sql: ${TABLE}."RSRC" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
