view: base {

  set: set_details_base {
    fields: [rsrc, ldts_raw]
  }

  set: set_details {
    fields: []
  }

  dimension: prefix {hidden: yes}
  # this dynamically calculates the name of the primary key of this table
  dimension: key_hash {
    group_label: "Data Vault Metadata"
    sql: ${TABLE}.{{ _view._name | remove_first: ${prefix} }}_hash ;;
    hidden: yes
  }

  dimension: pk {
    group_label: "Data Vault Metadata"
    sql: ${key_hash} ;;
    primary_key: yes
    hidden: yes
  }

  dimension_group: ldts {
    group_label: "Data Vault Load Time (LDTS)"
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

  dimension: rsrc {
    group_label: "Data Vault Metadata"
    type: string
    sql: ${TABLE}."RSRC" ;;
  }

  measure: latest_ldts {
    group_label: "Data Vault Load Time"
    label: "Most Recent Load Time"
    type: date_time
    sql: max(${ldts_raw}) ;;
  }

  measure: count {
    type: count
    #label: "{% if _view._name == 'something' %} Happy {% else %} sad {% endif %}"
    label: "# {{ _view._name | remove_first: 'hub_' | capitalize }}s"
    drill_fields: [set_details_base*, set_details*]
    hidden: yes
  }
}
