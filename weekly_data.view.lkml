view: weekly_data {
  sql_table_name: FIVETRAN_CNOW_CXP_ANALYSIS.WEEKLY_DATA ;;

  dimension: _fivetran_deleted {
    type: yesno
    sql: ${TABLE}._FIVETRAN_DELETED ;;
  }

  dimension: _fivetran_index {
    type: number
    sql: ${TABLE}._FIVETRAN_INDEX ;;
  }

  dimension: _fivetran_synced {
    type: string
    sql: ${TABLE}._FIVETRAN_SYNCED ;;
  }

  dimension: avgscore {
    type: number
    sql: ${TABLE}.AVGSCORE ;;
  }

  dimension: itemname {
    type: string
    sql: ${TABLE}.ITEMNAME ;;
  }

  dimension: ntakes {
    type: number
    sql: ${TABLE}.NTAKES ;;
  }

  dimension: productcode {
    type: string
    sql: ${TABLE}.PRODUCTCODE ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}.SOURCE ;;
  }

  dimension_group: weekstart {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.WEEKSTART ;;
  }

  measure: count {
    type: count
    drill_fields: [itemname]
  }
}
