view: l {
  derived_table: {
  sql: SELECT
    a.productcode,
    a.itemName,
    sum(a.nTakes) as total_takes,
    sum(a.nTakes*a.avgScore)/sum(a.nTakes) as avg_score
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

  dimension: avg_s {
    type: number
    sql: ${TABLE}."AVG_SCORE" ;;
  }

  dimension: takes {
    type: number
    sql: ${TABLE}."total_TAKES" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
