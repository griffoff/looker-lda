view: l {
  derived_table: {
  sql: SELECT
    a.productcode as PRODUCTCODE,
    a.itemName as ITEMNAME,
    sum(a.nTakes) as TOTAL_TAKES,
    sum(a.nTakes*a.avgScore)/sum(a.nTakes) as A_SCORE
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
    hidden:  yes
  }

  dimension: a_score {
    type: number
    sql: ${TABLE}."A_SCORE" ;;
    hidden: yes
  }

  measure: t_takes {
    sql: ${total_takes} ;;
  }

  measure: AVG_SCORE {
    sql: ${a_score} ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
