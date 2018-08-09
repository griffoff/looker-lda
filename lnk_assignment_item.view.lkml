view: lnk_assignment_item {
  sql_table_name: DATAVAULT.LNK_ASSIGNMENT_ITEM ;;

  dimension: assignmenthash {
    type: string
    sql: ${TABLE}."ASSIGNMENTHASH" ;;
  }

  dimension: assignmentitemidhash {
    type: string
    sql: ${TABLE}."ASSIGNMENTITEMIDHASH" ;;
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

  measure: count {
    type: count
    drill_fields: []
  }
}
