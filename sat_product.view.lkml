include: "sat_base.view.lkml"
view: sat_product {
  extends: [sat_base]
  sql_table_name: DATAVAULT.SAT_PRODUCT ;;

  dimension: all_authors_nm {
    type: string
    sql: ${TABLE}."ALL_AUTHORS_NM" ;;
  }

  dimension: copyright_yr {
    type: string
    sql: ${TABLE}."COPYRIGHT_YR" ;;
  }

  dimension: edition {
    type: string
    sql: ${TABLE}."EDITION" ;;
  }

  dimension: edition_cd {
    type: string
    sql: ${TABLE}."EDITION_CD" ;;
  }

  dimension: edition_de {
    type: string
    sql: ${TABLE}."EDITION_DE" ;;
  }

  dimension: hashdiff {
    type: string
    sql: ${TABLE}."HASHDIFF" ;;
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

  dimension: platform {
    type: string
    sql: ${TABLE}."PLATFORM" ;;
  }

  dimension: prod_family_cd {
    type: string
    sql: ${TABLE}."PROD_FAMILY_CD" ;;
  }

  dimension: prod_family_de {
    type: string
    sql: ${TABLE}."PROD_FAMILY_DE" ;;
  }

  dimension: producthash {
    type: string
    sql: ${TABLE}."PRODUCTHASH" ;;
  }

  dimension: pub_series_cd {
    type: string
    sql: ${TABLE}."PUB_SERIES_CD" ;;
  }

  dimension: pub_series_de {
    type: string
    sql: ${TABLE}."PUB_SERIES_DE" ;;
  }

  dimension: rsrc {
    type: string
    sql: ${TABLE}."RSRC" ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}."TITLE" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
