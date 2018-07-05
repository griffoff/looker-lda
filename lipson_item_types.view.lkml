view: lipson_item_types {
  sql_table_name: FIVETRAN_CNOW_CXP_ANALYSIS.ITEM_TYPES ;;

  dimension: _fivetran_deleted {
    type: yesno
    sql: ${TABLE}._FIVETRAN_DELETED ;;
  }

  dimension: _fivetran_id {
    type: string
    sql: ${TABLE}._FIVETRAN_ID ;;
    hidden: yes
  }

  dimension: _fivetran_index {
    type: number
    sql: ${TABLE}._FIVETRAN_INDEX ;;
    hidden: yes
  }

  dimension: _fivetran_synced {
    type: string
    sql: ${TABLE}._FIVETRAN_SYNCED ;;
    hidden: yes
  }

  dimension: fieldtypes {
    type: string
    sql: ${TABLE}.FIELDTYPES ;;
  }

  dimension: gradingmethods {
    type: string
    sql: ${TABLE}.GRADINGMETHODS ;;
    hidden: yes
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

  measure: percent_of_total_activities {
    type: percent_of_total
    sql: ${count} ;;
    value_format: "0.0000\%"
  }
}
