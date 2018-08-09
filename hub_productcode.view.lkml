view: hub_productcode {
  sql_table_name: DATAVAULT.HUB_PRODUCTCODE ;;

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

  dimension: productcode {
    type: string
    sql: ${TABLE}."PRODUCTCODE" ;;
  }

  dimension: productcodehash {
    type: string
    sql: ${TABLE}."PRODUCTCODEHASH" ;;
    primary_key: yes
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
