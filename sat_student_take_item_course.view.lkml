include: "sat_base.view.lkml"
view: sat_student_take_item_course {
  extends: [sat_base]
  sql_table_name: DATAVAULT.SAT_STUDENT_TAKE_ITEM_COURSE ;;

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
    alias: [sat_student_take_item.itemname]
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
    alias: [sat_student_take_item.productcode]
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
    alias: [sat_student_take_item.startedat]
  }

  dimension: userguidtakeitemidcoursekeyhash {
    type: string
    sql: ${TABLE}."USERGUIDTAKEITEMIDCOURSEKEYHASH" ;;
    primary_key: yes
  }

  dimension: coursekeyhash {
    type: string
    sql: ${TABLE}."COURSEKEYHASH" ;;
  }


  measure: count {
    type: count
    drill_fields: [itemname]
    alias: [sat_student_take_item.count]
  }

  measure: score_average {
    type: average
    sql: ${score} ;;
    value_format_name: decimal_3
    alias: [sat_student_take_item.score_average]
  }

  measure: latest_startedat {
    type: date_time
    sql: max(${startedat_raw}) ;;
  }

}
