view: hub_coursesection {
  sql_table_name: DATAVAULT.HUB_COURSESECTION ;;

  dimension: coursekey {
    type: string
    sql: ${TABLE}."COURSEKEY" ;;
  }

  dimension: coursekeyhash {
    type: string
    sql: ${TABLE}."COURSEKEYHASH" ;;
    primary_key: yes
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

  measure: count {
    type: count
    drill_fields: [rsrc, coursekey, coursekeyhash]
  }
}
