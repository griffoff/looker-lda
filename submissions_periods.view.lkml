view: submissions_periods {
  sql_table_name: FIVETRAN_CNOW_CXP_ANALYSIS.SUBMISSIONS ;;

    dimension: _fivetran_deleted {
      type: yesno
      sql: ${TABLE}._FIVETRAN_DELETED ;;
    }

    dimension: _fivetran_index {
      type: number
      sql: ${TABLE}._FIVETRAN_INDEX ;;
      hidden: yes
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
      hidden: yes
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
      hidden: yes
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
      group_label: "Item Uri"
      type: string
      sql: ${TABLE}.ITEMURI ;;
      hidden: yes
    }

    dimension: itemuri_system {
      group_label: "Item Uri"
      type: string
      sql: split_part(${TABLE}.ITEMURI, ':', 1) ;;
      hidden: yes
    }

    dimension: itemuri_productcode {
      group_label: "Item Uri"
      type: string
      sql: split_part(${TABLE}.ITEMURI, ':', 2) ;;
      hidden: yes
    }

    dimension: itemuri_itemid {
      group_label: "Item Uri"
      type: string
      sql: split_part(${TABLE}.ITEMURI, ':', -1) ;;
      hidden: yes
    }

    measure: item_uri_example {
      group_label: "Item Uri"
      type: string
      sql: any_value(${itemuri}) ;;
      hidden: yes
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
      hidden: yes
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
      # value_format_name: percent_0
    }

    measure: scoreavg {
      type: average
      sql: ${score} ;;
     # value_format_name: percent_1
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
      hidden: yes
    }

    dimension: time {
      type: number
      sql: ${TABLE}."TIME" ;;
      hidden: yes
    }

    dimension_group: time {
      group_label: "Submission Date"
      label: "Submission"
      type: time
      timeframes: [year, month, week, day_of_week, date, day_of_month, time, raw]
      #sql: to_timestamp(${TABLE}.TIME*1000, 3) ;;
      sql: to_timestamp(cast(TIME*1000 AS bigint),3) ;;
    }

    dimension: urialiases {
      type: string
      sql: ${TABLE}.URIALIASES ;;
      hidden: yes
    }

    dimension: uricanonical {
      type: string
      sql: ${TABLE}.URICANONICAL ;;
      hidden: yes
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
