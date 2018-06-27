view: dv_lnk_take {
  sql_table_name: DATAVAULT_LIPSON.LNK_TAKE ;;

  dimension: applicationhash {
    type: string
    sql: ${TABLE}."APPLICATIONHASH" ;;
  }

  dimension: assignmenthash {
    type: string
    sql: ${TABLE}."ASSIGNMENTHASH" ;;
  }

  dimension: coursekeyhash {
    type: string
    sql: ${TABLE}."COURSEKEYHASH" ;;
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

  dimension: lnk_takehash {
    type: string
    sql: ${TABLE}."LNK_TAKEHASH" ;;
  }

  dimension: nodehash {
    type: string
    sql: ${TABLE}."NODEHASH" ;;
  }

  dimension: productcodehash {
    type: string
    sql: ${TABLE}."PRODUCTCODEHASH" ;;
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

  measure: count {
    type: count
    drill_fields: []
  }
}
