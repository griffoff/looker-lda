view: cxp_hub_assignment {
  sql_table_name: DATAVAULTCXP.HUB_ASSIGNMENT ;;

  dimension: assignment {
    type: string
    sql: ${TABLE}."ASSIGNMENT" ;;
  }

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

  measure: count {
    type: count
    drill_fields: []
  }
}
