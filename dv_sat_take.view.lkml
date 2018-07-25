view: dv_sat_take {
  sql_table_name: DATAVAULT_LIPSON.SAT_TAKE ;;

  dimension: activitystart {
    type: string
    sql: ${TABLE}."ACTIVITYSTART" ;;
    hidden: yes
  }

  dimension: activitytype {
    type: string
    sql: ${TABLE}."ACTIVITYTYPE" ;;
    hidden: yes
  }

  dimension: geyserversion {
    type: string
    sql: ${TABLE}."GEYSERVERSION" ;;
    hidden: yes
  }

  dimension: hashdiff {
    type: string
    sql: ${TABLE}."HASHDIFF" ;;
    hidden: yes
  }

  dimension: itemname {
    type: string
    sql: ${TABLE}."ITEMNAME" ;;
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
    hidden: yes
  }

  dimension: regenindex {
    type: string
    sql: ${TABLE}."REGENINDEX" ;;
    hidden: yes
  }

  dimension: rsrc {
    type: string
    sql: ${TABLE}."RSRC" ;;
    hidden: yes
  }

  dimension: score {
    type: string
    sql: ${TABLE}."SCORE" ;;
  }

  dimension: seed {
    type: string
    sql: ${TABLE}."SEED" ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}."SOURCE" ;;
  }

  dimension: takeindex {
    type: string
    sql: ${TABLE}."TAKEINDEX" ;;
    hidden: yes
  }

  dimension_group: time {
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
    sql: ${TABLE}."TIME" ;;
  }

  dimension: urialiases {
    type: string
    sql: ${TABLE}."URIALIASES" ;;
    hidden: yes
  }

  dimension: uricanonical {
    type: string
    sql: ${TABLE}."URICANONICAL" ;;
    hidden: yes
  }

  measure: count {
    label: "Total Takes"
    type: count
    drill_fields: [itemname]
  }

  measure: Average_Score {
    type: average
    sql: ${score} ;;
  }
}
