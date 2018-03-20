view: regenerations {
  sql_table_name: FIVETRAN_CNOW_CXP_ANALYSIS.REGENERATIONS ;;

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

  dimension: itemuri {
    type: string
    sql: ${TABLE}.ITEMURI ;;
  }

  dimension: nodeid {
    type: string
    sql: ${TABLE}.NODEID ;;
  }

  dimension: takeid {
    type: string
    sql: ${TABLE}.TAKEID ;;
  }

  dimension: time {
    type: number
    sql: ${TABLE}.TIME ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
