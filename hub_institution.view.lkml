view: hub_institution {
  sql_table_name: DATAVAULT.HUB_INSTITUTION ;;

  dimension: institution {
    type: string
    sql: ${TABLE}."INSTITUTION" ;;
  }

  dimension: institutionhash {
    type: string
    sql: ${TABLE}."INSTITUTIONHASH" ;;
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
