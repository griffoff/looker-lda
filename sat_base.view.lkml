view: sat_base {

  dimension_group: ledts {}
  dimension_group: ldts {}

  dimension: is_current {
    type: yesno
    sql: ${ledts_raw} >= '9999-12-31' ;;
    hidden: yes
  }

  measure: latest_ldts {
    type: date_time
    sql: max(${ldts_raw}) ;;
  }
 }
