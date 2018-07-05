view: dv_sat_itemtypes {
  sql_table_name: DATAVAULT_LIPSON.SAT_ITEMTYPES ;;

  dimension: fieldtypes {
    type: string
    sql: ${TABLE}."FIELDTYPES" ;;
  }

  dimension: hashdiff {
    type: string
    sql: ${TABLE}."HASHDIFF" ;;
  }

  dimension: itemname {
    type: string
    sql: ${TABLE}."ITEMNAME" ;;
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

  dimension_group: ledts {
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
    sql: ${TABLE}."LEDTS" ;;
  }

  dimension: problemtype {
    type: string
    sql: ${TABLE}."PROBLEMTYPE" ;;
  }

  dimension: productcodehash {
    type: string
    sql: ${TABLE}."PRODUCTCODEHASH" ;;
  }

  dimension: rsrc {
    type: string
    sql: ${TABLE}."RSRC" ;;
  }

  measure: count {
    type: count
    drill_fields: [itemname]
  }

  measure: percent_of_total_activities {
    type: percent_of_total
    sql: ${problemtype} ;;
  }
}
