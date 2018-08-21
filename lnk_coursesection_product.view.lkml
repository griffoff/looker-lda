view: lnk_coursesection_product {
  sql_table_name: DATAVAULT.LNK_COURSESECTION_PRODUCT ;;

  dimension: coursekeyhash {
    type: string
    sql: ${TABLE}."COURSEKEYHASH" ;;
  }

  dimension: coursekeyproducthash {
    type: string
    sql: ${TABLE}."COURSEKEYPRODUCTHASH" ;;
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

  dimension: producthash {
    type: string
    sql: ${TABLE}."PRODUCTHASH" ;;
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
