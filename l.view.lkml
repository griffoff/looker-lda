view: l {
  derived_table: {
  sql: SELECT
    a.productcode as PRODUCTCODE,
    a.itemName as ITEMNAME,
    sum(a.nTakes) as TOTAL_TAKES,
    sum(a.nTakes*a.avgScore)/sum(a.nTakes) as AVG_SCORE
  FROM ${lipson_weekly_aggregation.SQL_TABLE_NAME} a
  GROUP BY a.productCode, a.itemName
  ;;
 }

  dimension: productcode {
    type: string
    sql: ${TABLE}."PRODUCTCODE" ;;
  }

  dimension: itemname {
    type: string
    sql: ${TABLE}."ITEMNAME" ;;
  }

  dimension: total_takes {
    type: number
    sql: ${TABLE}."TOTAL_TAKES" ;;
  }

  dimension: avg_score {
    type: number
    sql: ${TABLE}."AVG_SCORE" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
