view: hub_book {
  sql_table_name: DATAVAULTCNOW.HUB_BOOK ;;

  dimension: book {
    type: string
    sql: ${TABLE}."BOOK" ;;
  }

  dimension: bookhash {
    type: string
    sql: ${TABLE}."BOOKHASH" ;;
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
