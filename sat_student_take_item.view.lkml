include: "sat_base.view.lkml"
view: sat_student_take_item {
  extends: [sat_base]
  sql_table_name: DATAVAULT.SAT_STUDENT_TAKE_ITEM ;;

  dimension_group: finishedat {
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
    sql: ${TABLE}."FINISHEDAT" ;;
  }

  dimension: hashdiff {
    type: string
    sql: ${TABLE}."HASHDIFF" ;;
  }

  dimension: itemname {
    type: string
    sql: ${TABLE}."ITEMNAME" ;;
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

  dimension: productcode {
    type: string
    sql: ${TABLE}."PRODUCTCODE" ;;
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

  dimension_group: startedat {
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
    sql: ${TABLE}."STARTEDAT" ;;
  }

  dimension: userguidtakeitemidhash {
    type: string
    sql: ${TABLE}."USERGUIDTAKEITEMIDHASH" ;;
    primary_key: yes
  }

  measure: count {
    type: count
    drill_fields: [itemname]
  }

  measure: score_average {
    type: average
    sql: ${score} ;;
    value_format_name: decimal_3
  }

  measure: latest_startedat {
    type: max
    sql: coalesce(${startedat_raw}, 0::timestamp) ;;
  }

}
