view: submissions {
  sql_table_name: FIVETRAN_CNOW_CXP_ANALYSIS.SUBMISSIONS ;;

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

  dimension: activitystart {
    type: number
    sql: ${TABLE}.ACTIVITYSTART ;;
  }

  dimension: activitytype {
    type: string
    sql: ${TABLE}.ACTIVITYTYPE ;;
  }

  dimension: application {
    type: string
    sql: ${TABLE}.APPLICATION ;;
  }

  dimension: assignmenturi {
    type: string
    sql: ${TABLE}.ASSIGNMENTURI ;;
  }

  dimension: courseuri {
    type: string
    sql: ${TABLE}.COURSEURI ;;
  }

  dimension: geyserversion {
    type: number
    sql: ${TABLE}.GEYSERVERSION ;;
  }

  dimension: itemid {
    type: string
    sql: ${TABLE}.ITEMID ;;
  }

  dimension: itemname {
    type: string
    sql: ${TABLE}.ITEMNAME ;;
  }

  dimension: itemuri {
    type: string
    sql: ${TABLE}.ITEMURI ;;
  }

  dimension: nodeid {
    type: string
    sql: ${TABLE}.NODEID ;;
  }

  dimension: productcode {
    type: string
    sql: ${TABLE}.PRODUCTCODE ;;
  }

measure:  productcount{
  type: count_distinct
  sql: ${productcode} ;;
}

  dimension: regenindex {
    type: number
    sql: ${TABLE}.REGENINDEX ;;
  }

  dimension: score {
    type: number
    sql: ${TABLE}.SCORE ;;
    hidden: yes
  }

dimension:  scorebuckets{
    type: tier
    sql: ${score} ;;
    tiers: [0.2, 0.4, 0.6, 0.8]
    style: relational
    value_format_name: percent_0
}

measure: scoreavg {
  type: average
  sql: ${score} ;;
  value_format_name: percent_1
  label: "Average Score"
}
  dimension: seed {
    type: string
    sql: ${TABLE}.SEED ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}.SOURCE ;;
  }

  dimension: takeid {
    type: string
    sql: ${TABLE}.TAKEID ;;
  }

  dimension: takeindex {
    type: number
    sql: ${TABLE}.TAKEINDEX ;;
  }

  dimension: time {
    type: number
    sql: ${TABLE}.TIME ;;
  }

  dimension: urialiases {
    type: string
    sql: ${TABLE}.URIALIASES ;;
  }

  dimension: uricanonical {
    type: string
    sql: ${TABLE}.URICANONICAL ;;
  }

  dimension: useruri {
    type: string
    sql: ${TABLE}.USERURI ;;
  }

  measure: count {
    type: count
    drill_fields: [itemname]
  }

}
