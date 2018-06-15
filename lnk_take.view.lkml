view: lnk_take {
  sql_table_name: DATAVAULTCNOW.LNK_TAKE ;;

  dimension: assignmenthash {
    type: string
    sql: ${TABLE}."ASSIGNMENTHASH" ;;
  }

  dimension: bookhash {
    type: string
    sql: ${TABLE}."BOOKHASH" ;;
  }

  dimension: cnowuserhash {
    type: string
    sql: ${TABLE}."CNOWUSERHASH" ;;
  }

  dimension: institutionhash {
    type: string
    sql: ${TABLE}."INSTITUTIONHASH" ;;
  }

  dimension: itemuidhash {
    type: string
    sql: ${TABLE}."ITEMUIDHASH" ;;
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

  dimension: rsrc {
    type: string
    sql: ${TABLE}."RSRC" ;;
  }

  dimension: sectionhash {
    type: string
    sql: ${TABLE}."SECTIONHASH" ;;
  }

  dimension: testhash {
    type: string
    sql: ${TABLE}."TESTHASH" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
