include: "base.sat_base.view.lkml"
view: sat_product {
  extends: [sat_base]
  sql_table_name: DATAVAULT.SAT_PRODUCT ;;

  set: set_details {fields:[title, pub_series_de, prod_family_de, edition_de, copyright_yr, all_authors_nm, platform]}

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

  dimension: product_hash {
    type: string
    sql: ${TABLE}."PRODUCT_HASH" ;;
  }

  dimension: pub_series_cd {
    type: string
    sql: ${TABLE}."PUB_SERIES_CD" ;;
  }

  dimension: pub_series_de {
    type: string
    sql: ${TABLE}."PUB_SERIES_DE" ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}."TITLE" ;;
  }

}
