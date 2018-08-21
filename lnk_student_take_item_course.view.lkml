view: lnk_student_take_item_course {
  sql_table_name: DATAVAULT.LNK_STUDENT_TAKE_ITEM_COURSE ;;

  dimension: coursekeyhash {
    type: string
    sql: ${TABLE}."COURSEKEYHASH" ;;
  }

  dimension: itemidhash {
    type: string
    sql: ${TABLE}."ITEMIDHASH" ;;
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

  dimension: rsrc {
    type: string
    sql: ${TABLE}."RSRC" ;;
  }

  dimension: takehash {
    type: string
    sql: ${TABLE}."TAKEHASH" ;;
  }

  dimension: userguidhash {
    type: string
    sql: ${TABLE}."USERGUIDHASH" ;;
  }

  dimension: userguidtakeitemidcoursekeyhash {
    type: string
    sql: ${TABLE}."USERGUIDTAKEITEMIDCOURSEKEYHASH" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
