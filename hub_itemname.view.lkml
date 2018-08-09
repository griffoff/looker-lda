view: hub_itemname {
  sql_table_name: DATAVAULT.HUB_ITEMNAME ;;

  dimension: itemname {
    type: string
    sql: ${TABLE}."ITEMNAME" ;;
  }

  dimension: itemnamehash {
    type: string
    sql: ${TABLE}."ITEMNAMEHASH" ;;
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
    drill_fields: [itemname]
  }
}
