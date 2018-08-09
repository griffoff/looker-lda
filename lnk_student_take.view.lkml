view: lnk_student_take {
  sql_table_name: DATAVAULT.LNK_STUDENT_TAKE ;;

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

  dimension: userguidtakehash {
    type: string
    sql: ${TABLE}."USERGUIDTAKEHASH" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
