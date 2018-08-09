view: hub_item {
  sql_table_name: DATAVAULT.HUB_ITEM ;;

  dimension: itemid {
    type: string
    sql: ${TABLE}."ITEMID" ;;
  }

  dimension: itemidhash {
    type: string
    sql: ${TABLE}."ITEMIDHASH" ;;
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
