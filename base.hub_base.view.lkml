include: "base.view.lkml"
view: hub_base {
  extends: [base]
  dimension: prefix {sql: 'hub_';;}

  dimension: key {
    group_label: "Data Vault Metadata"
    sql: ${TABLE}.{{ _view._name | remove_first: ${prefix} }} ;;
    hidden: yes
  }

  dimension: rsrc {
    group_label: "Data Vault Metadata"
    type: string
    sql: ${TABLE}."RSRC" ;;
  }


  set: set_details_base {fields:[key, rsrc, ldts_raw]}

  measure: count {
    hidden:  no
  }
}
