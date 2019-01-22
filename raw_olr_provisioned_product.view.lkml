view: raw_olr_provisioned_product {
  sql_table_name: DELETE_DVTEST.RAW_OLR_PROVISIONED_PRODUCT ;;

  dimension: _hash {
    type: string
    sql: ${TABLE}."_HASH" ;;
  }

  dimension_group: _ldts {
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
    sql: ${TABLE}."_LDTS" ;;
  }

  dimension: _rsrc {
    type: string
    sql: ${TABLE}."_RSRC" ;;
  }

  dimension: code_type {
    type: string
    sql: ${TABLE}."CODE_TYPE" ;;
  }

  dimension: context_id {
    type: string
    sql: ${TABLE}."CONTEXT_ID" ;;
  }

  dimension: core_text_isbn {
    type: string
    sql: ${TABLE}."CORE_TEXT_ISBN" ;;
  }

  dimension_group: date_added {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month
    ]
    sql: ${TABLE}."DATE_ADDED" ;;
  }

  dimension: deleted {
    type: yesno
    sql: ${TABLE}."DELETED" ;;
  }

  dimension_group: expiration {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month
    ]
    sql: ${TABLE}."EXPIRATION_DATE" ;;
  }

  dimension: iac_isbn {
    type: string
    sql: ${TABLE}."IAC_ISBN" ;;
  }

  dimension: institution_id {
    type: string
    sql: ${TABLE}."INSTITUTION_ID" ;;
  }

  dimension_group: local {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month
    ]
    sql: ${TABLE}."LOCAL_TIME" ;;
  }

  dimension: message_format_version {
    type: string
    sql: ${TABLE}."MESSAGE_FORMAT_VERSION" ;;
  }

  dimension: message_type {
    type: string
    sql: ${TABLE}."MESSAGE_TYPE" ;;
  }

  dimension: platform_environment {
    type: string
    sql: ${TABLE}."PLATFORM_ENVIRONMENT" ;;
  }

  dimension: product_id {
    type: string
    sql: ${TABLE}."PRODUCT_ID" ;;
  }

  dimension: product_platform {
    type: string
    sql: ${TABLE}."PRODUCT_PLATFORM" ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}."REGION" ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}."source" ;;
  }

  dimension: source_id {
    type: string
    sql: ${TABLE}."SOURCE_ID" ;;
  }

  dimension: flag {
    sql: ${TABLE}."SOURCE_ID" ;;
    case: {
      when: {
        sql: ${TABLE}."SOURCE_ID"='TRIAL' ;;
        label: "TRIAL Access"
      }
      when: {
        sql: Try_to_Decimal(${TABLE}."SOURCE_ID") is not NULL ;;
        label: "FULL Access"
      }
      # possibly more when statements
      else: "Other cases"
    }
  }

  dimension: user_environment {
    type: string
    sql: ${TABLE}."USER_ENVIRONMENT" ;;
  }

  dimension: user_sso_guid {
    type: string
    sql: ${TABLE}."USER_SSO_GUID" ;;
  }

  dimension: user_type {
    type: string
    sql: ${TABLE}."USER_TYPE" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: count_Users {
    description: "The count of users"
    type: count_distinct
    sql: ${TABLE}."USER_SSO_GUID"  ;;
  }

  measure: count_Users_Products {
    description: "The count of users-products"
    type: count_distinct
    sql: ${TABLE}."USER_SSO_GUID", ${TABLE}."PRODUCT_ID"  ;;
  }

  measure: count_hash {
    description: "The count of distinct hash"
    type: count_distinct
    sql: ${TABLE}."_HASH"  ;;
    }
}
