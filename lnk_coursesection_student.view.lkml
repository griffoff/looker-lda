view: lnk_coursesection_student {
  sql_table_name: DATAVAULT.LNK_COURSESECTION_STUDENT ;;

  dimension: coursekeyhash {
    type: string
    sql: ${TABLE}."COURSEKEYHASH" ;;
  }

  dimension: coursekeyuserguidhash {
    type: string
    sql: ${TABLE}."COURSEKEYUSERGUIDHASH" ;;
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

  dimension: userguidhash {
    type: string
    sql: ${TABLE}."USERGUIDHASH" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
