view: cxp_sat_take {
  sql_table_name: DATAVAULTCXP.SAT_TAKE ;;

  dimension: hashdiff {
    type: string
    sql: ${TABLE}."HASHDIFF" ;;
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

  dimension_group: ledts {
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
    sql: ${TABLE}."LEDTS" ;;
  }

  dimension: lnk_takehash {
    type: string
    sql: ${TABLE}."LNK_TAKEHASH" ;;
  }

  dimension: rsrc {
    type: string
    sql: ${TABLE}."RSRC" ;;
  }

  dimension: score {
    type: number
    sql: ${TABLE}."SCORE" ;;
  }

  dimension: seed {
    type: string
    sql: ${TABLE}."SEED" ;;
  }

  dimension_group: take {
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
    sql: ${TABLE}."TAKE_TIME" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: average {
    type: count
    drill_fields: [score]
  }
}
