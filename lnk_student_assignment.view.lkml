view: lnk_student_assignment {
  sql_table_name: DATAVAULT.LNK_STUDENT_ASSIGNMENT ;;

  dimension: assignmenthash {
    type: string
    sql: ${TABLE}."ASSIGNMENTHASH" ;;
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

  dimension: userguidassignmenthash {
    type: string
    sql: ${TABLE}."USERGUIDASSIGNMENTHASH" ;;
    primary_key: yes
  }

  dimension: userguidhash {
    type: string
    sql: ${TABLE}."USERGUIDHASH" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
