view: hub_student {
  sql_table_name: DATAVAULT.HUB_STUDENT ;;

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

  dimension: userguid {
    type: string
    sql: ${TABLE}."USERGUID" ;;
  }

  dimension: userguidhash {
    type: string
    sql: ${TABLE}."USERGUIDHASH" ;;
    primary_key: yes
  }

  measure: count {
    type: count
    drill_fields: []
    value_format_name: decimal_0
  }
}
