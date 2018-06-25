view: lipson_weekly_aggregation {
  derived_table: {
    sql: SELECT
          a.productcode,
          a.itemName,
          sum(a.nTakes) as takes,
          sum(a.nTakes*a.avgScore)/sum(a.nTakes) as avg_s
        FROM (
          SELECT
            to_date(to_timestamp_ntz(
              cast(s.time * 1000 AS bigint) - MOD(cast(s.time * 1000 AS bigint), 604800000) + 345600000,
              3
            )) AS weekStart,
            s.productcode,
            s.itemname,
            avg(s.score) AS avgScore,
            count(*) AS nTakes
          FROM LDA.FIVETRAN_CNOW_CXP_ANALYSIS.submissions s
          WHERE s.score >= 0 AND s._fivetran_deleted = FALSE
          GROUP BY weekStart,productcode,itemname
        ) a
        GROUP BY a.productCode, a.itemName
       ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  dimension: productcode {
    type: string
    sql: ${TABLE}."PRODUCTCODE" ;;
  }

  dimension: itemname {
    type: string
    sql: ${TABLE}."ITEMNAME" ;;
  }

  dimension: takes {
    type: number
    sql: ${TABLE}."TAKES" ;;
  }

  dimension: avg_score {
    type: number
    sql: ${TABLE}."AVG_S" ;;
  }
}
