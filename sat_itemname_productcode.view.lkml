include: "sat_base.view.lkml"
view: sat_itemname_productcode {
  extends: [sat_base]
  sql_table_name: DATAVAULT.SAT_ITEMNAME_PRODUCTCODE ;;

  dimension: fieldtype {
    type: string
    sql: ${TABLE}."FIELDTYPE" ;;
  }

  dimension: hashdiff {
    type: string
    sql: ${TABLE}."HASHDIFF" ;;
  }

  dimension: itemnameproductcodehash {
    type: string
    sql: ${TABLE}."ITEMNAMEPRODUCTCODEHASH" ;;
    primary_key: yes
  }

  dimension: itemtype {
    type: string
    sql: ${TABLE}."ITEMTYPE" ;;
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

  dimension: rsrc {
    type: string
    sql: ${TABLE}."RSRC" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
