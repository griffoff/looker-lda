include: "base.view.lkml"

view: sat_base {
  extends: [base]

  dimension: prefix {sql: 'sat_';;}

  dimension: pk {
    sql: array_to_string(array_construct(${key_hash}, ${ledts_raw}), '||') ;;
    primary_key: yes
    hidden: yes
  }

  dimension: active {
    group_label: "Data Vault Metadata"
    type: yesno
    sql: ${TABLE}."ACTIVE" ;;
  }

  dimension: is_current {
    type: yesno
#     sql: ${ledts_raw} >= '9999-12-31' ;;
    sql: ${active} ;;
    hidden: yes
  }

  dimension_group: ledts {
    group_label: "Data Vault Record End Time (LEDTS)"
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

  dimension: hashdiff {
    group_label: "Data Vault Metadata"
    type: string
    sql: ${TABLE}."HASHDIFF" ;;
  }

}
