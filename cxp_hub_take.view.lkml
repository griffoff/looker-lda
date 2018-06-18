view: cxp_hub_take {
  sql_table_name: DATAVAULTCXP.HUB_TAKE ;;

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

  dimension: take {
    type: string
    sql: ${TABLE}."TAKE" ;;
  }

  dimension: takehash {
    type: string
    sql: ${TABLE}."TAKEHASH" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
