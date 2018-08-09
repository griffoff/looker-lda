include: "sat_base.view.lkml"
view: sat_institution {
  extends: [sat_base]
  sql_table_name: DATAVAULT.SAT_INSTITUTION ;;

  dimension: city {
    type: string
    sql: ${TABLE}."CITY" ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}."COUNTRY" ;;
  }

  dimension: county {
    type: string
    sql: ${TABLE}."COUNTY" ;;
  }

  dimension: district {
    type: string
    sql: ${TABLE}."DISTRICT" ;;
  }

  dimension: hashdiff {
    type: string
    sql: ${TABLE}."HASHDIFF" ;;
  }

  dimension: institutionhash {
    type: string
    sql: ${TABLE}."INSTITUTIONHASH" ;;
    primary_key: yes
  }

  dimension: institutionname {
    type: string
    sql: ${TABLE}."INSTITUTIONNAME" ;;
  }

  dimension: institutionsubtype {
    type: string
    sql: ${TABLE}."INSTITUTIONSUBTYPE" ;;
  }

  dimension: institutiontype {
    type: string
    sql: ${TABLE}."INSTITUTIONTYPE" ;;
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
    drill_fields: [institutionname]
  }
}
