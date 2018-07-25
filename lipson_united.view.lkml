view: lipson_united {
  derived_table: {
    sql: SELECT
          'CXP' as source,
          to_date(to_timestamp_ntz(
            cast(s1.time * 1000 AS bigint) - MOD(cast(s1.time * 1000 AS bigint), 604800000) + 345600000,
            3
          )) AS weekStart,
          s1.productcode as productcode,
          s1.itemname as itemname,
          avg(s1.score) AS avgScore,
          count(*) AS nTakes
        FROM FIVETRAN_CNOW_CXP_ANALYSIS.submissions s1
        WHERE s1.score >= 0 AND s1._fivetran_deleted = FALSE
        GROUP BY weekStart,productcode,itemname
  UNION
  SELECT
          'CNOW' as source,
          to_date(to_timestamp_ntz(
            cast(s2.time * 1000 AS bigint) - MOD(cast(s2.time * 1000 AS bigint), 604800000) + 345600000,
            3
          )) AS weekStart,
          s2.productcode as productcode,
          s2.itemname as itemname,
          avg(s2.score) AS avgScore,
          count(*) AS nTakes
        FROM FIVETRAN_CNOW_CXP_ANALYSIS.submissions_cnow s2
        WHERE s2.score >= 0 AND s2._fivetran_deleted = FALSE
        GROUP BY weekStart,productcode,itemname
    ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}."SOURCE" ;;
  }

  dimension: weekstart {
    type: date
    sql: ${TABLE}."WEEKSTART" ;;
  }

  dimension: productcode {
    type: string
    sql: ${TABLE}."PRODUCTCODE" ;;
  }

  dimension: itemname {
    type: string
    sql: ${TABLE}."ITEMNAME" ;;
  }

  dimension: avgscore {
    type: number
    sql: ${TABLE}."AVGSCORE" ;;
  }

  dimension: ntakes {
    type: number
    sql: ${TABLE}."NTAKES" ;;
  }

  dimension: ntakes_times_avgscore {
    type: number
    sql: 1.0 * ${TABLE}."NTAKES" * ${TABLE}."AVGSCORE";;
    hidden:  yes
  }

  measure: total_ntakes_times_avgscore {
    type: sum
    sql: ${ntakes_times_avgscore} ;;
    hidden:  yes
  }

  measure: total_takes {
    type: sum
    sql: ${ntakes} ;;
  }

  measure: average_score {
    type: number
    sql: 1.0 * ${total_ntakes_times_avgscore} / ${total_takes} ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }



}
