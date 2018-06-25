view: lipson_weekly_aggregation {
  derived_table: {
    sql: SELECT
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
 ;;
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
    hidden: yes
  }

  dimension: ntakes {
    type: number
    sql: ${TABLE}."NTAKES";;
    hidden: yes
  }

  dimension: ntakes_times_avgscore {
    type: number
    sql: 1.0 * ${TABLE}."NTAKES" * ${TABLE}."AVGSCORE";;
    hidden: yes
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: total_takes {
    type: sum
    sql: ${ntakes};;
  }

  measure: total_ntakes_avgscore {
    type: sum
    sql: ${ntakes_times_avgscore};;
    hidden: yes
  }

  measure: avg_score {
    type: number
    sql: 1.0 * ${total_ntakes_avgscore} / ${total_takes} ;;
    #sum(a.nTakes*a.avgScore)/sum(a.nTakes)
  }
}
