view: cxp_hub_node {
  sql_table_name: DATAVAULTCXP.HUB_NODE ;;

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

  dimension: node {
    type: string
    sql: ${TABLE}."NODE" ;;
  }

  dimension: nodehash {
    type: string
    sql: ${TABLE}."NODEHASH" ;;
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
