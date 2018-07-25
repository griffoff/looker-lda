view: cxp_hub_itemid {
  sql_table_name: DATAVAULTCXP.HUB_ITEMID ;;

  dimension: itemid {
    type: string
    sql: ${TABLE}."ITEMID" ;;
  }

  dimension: itemidhash {
    type: string
    hidden: yes
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

  dimension: rsrc {
    type: string
    sql: ${TABLE}."RSRC" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
