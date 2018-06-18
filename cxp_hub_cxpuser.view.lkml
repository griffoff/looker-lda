view: cxp_hub_cxpuser {
  sql_table_name: DATAVAULTCXP.HUB_CXPUSER ;;

  dimension: cxpuser {
    type: string
    sql: ${TABLE}."CXPUSER" ;;
  }

  dimension: cxpuserhash {
    type: string
    sql: ${TABLE}."CXPUSERHASH" ;;
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
