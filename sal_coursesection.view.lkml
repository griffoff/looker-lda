view: sal_coursesection {
  sql_table_name: DATAVAULT.SAL_COURSESECTION ;;

  dimension: coursesection {
    type: string
    sql: ${TABLE}."COURSESECTION" ;;
  }

  dimension: coursesection_hash {
    type: string
    sql: ${TABLE}."COURSESECTION_HASH" ;;
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

  dimension: shadowcoursesection {
    type: string
    sql: ${TABLE}."SHADOWCOURSESECTION" ;;
  }

  dimension: shadowcoursesection_hash {
    type: string
    sql: ${TABLE}."SHADOWCOURSESECTION_HASH" ;;
  }

  dimension: shadowcoursesectioncoursesection_hash {
    type: string
    sql: ${TABLE}."SHADOWCOURSESECTIONCOURSESECTION_HASH" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
