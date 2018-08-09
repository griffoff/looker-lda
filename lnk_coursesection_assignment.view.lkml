view: lnk_coursesection_assignment {
  sql_table_name: DATAVAULT.LNK_COURSESECTION_ASSIGNMENT ;;

  dimension: assignmenthash {
    type: string
    sql: ${TABLE}."ASSIGNMENTHASH" ;;
  }

  dimension: coursekeyassignmenthash {
    type: string
    sql: ${TABLE}."COURSEKEYASSIGNMENTHASH" ;;
  }

  dimension: coursekeyhash {
    type: string
    sql: ${TABLE}."COURSEKEYHASH" ;;
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
    drill_fields: []
  }
}
