view: hub_assignment {
  sql_table_name: DATAVAULT.HUB_ASSIGNMENT ;;

  dimension: assignment {
    type: string
    sql: ${TABLE}."ASSIGNMENT" ;;
  }

  dimension: assignmenthash {
    type: string
    sql: ${TABLE}."ASSIGNMENTHASH" ;;
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
    drill_fields: []
  }
}
