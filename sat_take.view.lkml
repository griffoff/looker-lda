view: sat_take {
  sql_table_name: DATAVAULTCNOW.SAT_TAKE ;;

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

  dimension_group: take_date {
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
    sql: ${TABLE}."TAKE_DATE" ;;
  }

  dimension_group: take_modyf {
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
    sql: ${TABLE}."TAKE_MODYF" ;;
  }

  dimension: take_score {
    type: string
    sql: ${TABLE}."TAKE_SCORE" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
