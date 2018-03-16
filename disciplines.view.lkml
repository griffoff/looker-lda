view: disciplines {
  sql_table_name: FIVETRAN_CNOW_CXP_ANALYSIS.DISCIPLINES ;;

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

  dimension: category {
    type: string
    sql: ${TABLE}.CATEGORY ;;
  }

  dimension: discipline {
    type: string
    sql: ${TABLE}.DISCIPLINE ;;
  }

  dimension: productcode {
    type: string
    sql: ${TABLE}.PRODUCTCODE ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
