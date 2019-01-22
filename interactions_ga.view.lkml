view: interactions_ga {
  sql_table_name: DELETE_DVTEST.INTERACTIONS_GA ;;

  dimension: browser {
    type: string
    sql: ${TABLE}."BROWSER" ;;
  }

  dimension: browserversion {
    type: string
    sql: ${TABLE}."BROWSERVERSION" ;;
  }

  dimension: devicecategory {
    type: string
    sql: ${TABLE}."DEVICECATEGORY" ;;
  }

  dimension: eventaction {
    type: string
    sql: ${TABLE}."EVENTACTION" ;;
  }

  dimension: eventcategory {
    type: string
    sql: ${TABLE}."EVENTCATEGORY" ;;
  }

  dimension: eventlabel {
    type: string
    sql: ${TABLE}."EVENTLABEL" ;;
  }

  dimension: fullvisitorid {
    type: string
    sql: ${TABLE}."FULLVISITORID" ;;
  }

  dimension: ga_event {
    type: string
    sql: ${TABLE}."GA_EVENT" ;;
  }

  dimension_group: ga_local_time_from_json {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      minute
    ]
    sql: ${TABLE}."GA_LOCAL_TIME_FROM_JSON" ;;
  }

  dimension_group: ga {
    type: time
    timeframes: [
      time,
      date,
      week,
      month
    ]
    sql: ${TABLE}."GA_TIME" ;;
  }

  dimension: ga_userssoguid {
    type: string
    sql: ${TABLE}."GA_USERSSOGUID" ;;
  }

  dimension: geonetwork_country {
    type: string
    sql: ${TABLE}."GEONETWORK_COUNTRY" ;;
  }

  dimension: geonetwork_metro {
    type: string
    sql: ${TABLE}."GEONETWORK_METRO" ;;
  }

  dimension: geonetwork_region {
    type: string
    sql: ${TABLE}."GEONETWORK_REGION" ;;
  }

  dimension: hits_hitnumber {
    type: string
    sql: ${TABLE}."HITS_HITNUMBER" ;;
  }

  dimension: hits_hour {
    type: string
    sql: ${TABLE}."HITS_HOUR" ;;
  }

  dimension: hits_minute {
    type: string
    sql: ${TABLE}."HITS_MINUTE" ;;
  }

  dimension: hits_time {
    type: string
    sql: ${TABLE}."HITS_TIME" ;;
  }

  dimension: hits_type {
    type: string
    sql: ${TABLE}."HITS_TYPE" ;;
  }

  dimension: hostname {
    type: string
    sql: ${TABLE}."HOSTNAME" ;;
  }

  dimension: ismobile {
    type: string
    sql: ${TABLE}."ISMOBILE" ;;
  }

  dimension: mobiledevicebranding {
    type: string
    sql: ${TABLE}."MOBILEDEVICEBRANDING" ;;
  }

  dimension: operatingsystem {
    type: string
    sql: ${TABLE}."OPERATINGSYSTEM" ;;
  }

  dimension: operatingsystemversion {
    type: string
    sql: ${TABLE}."OPERATINGSYSTEMVERSION" ;;
  }

  dimension: pagepath {
    type: string
    sql: ${TABLE}."PAGEPATH" ;;
  }

  dimension: pagetitle {
    type: string
    sql: ${TABLE}."PAGETITLE" ;;
  }

  dimension: totals_hits {
    type: string
    sql: ${TABLE}."TOTALS_HITS" ;;
  }

  dimension: totals_pageviews {
    type: string
    sql: ${TABLE}."TOTALS_PAGEVIEWS" ;;
  }

  dimension: totals_timeonsite {
    type: string
    sql: ${TABLE}."TOTALS_TIMEONSITE" ;;
  }

  dimension: totals_visits {
    type: string
    sql: ${TABLE}."TOTALS_VISITS" ;;
  }

  dimension: visitnumber {
    type: string
    sql: ${TABLE}."VISITNUMBER" ;;
  }

  measure: count {
    type: count
    drill_fields: [hostname]
  }
}
