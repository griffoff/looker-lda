view: item_types {
  sql_table_name: FIVETRAN_CNOW_CXP_ANALYSIS.ITEM_TYPES ;;

  dimension: _fivetran_deleted {
    type: yesno
    sql: ${TABLE}._FIVETRAN_DELETED ;;
  }

  dimension: _fivetran_id {
    type: string
    sql: ${TABLE}._FIVETRAN_ID ;;
  }

  dimension: _fivetran_index {
    type: number
    sql: ${TABLE}._FIVETRAN_INDEX ;;
  }

  dimension: _fivetran_synced {
    type: string
    sql: ${TABLE}._FIVETRAN_SYNCED ;;
  }

  dimension: fieldtypes {
    type: string
    sql: ${TABLE}.FIELDTYPES ;;
  }

  dimension: gradingmethods {
    type: string
    sql: ${TABLE}.GRADINGMETHODS ;;
  }

  dimension: itemname {
    type: string
    sql: ${TABLE}.ITEMNAME ;;
  }

  dimension: problemtype {
    type: string
    sql: ${TABLE}.PROBLEMTYPE ;;
  }

  dimension: productcode {
    type: string
    sql: ${TABLE}.PRODUCTCODE ;;
  }

  measure: count {
    type: count
    drill_fields: [itemname]
  }
}
