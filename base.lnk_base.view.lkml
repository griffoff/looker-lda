include: "base.view.lkml"
view: lnk_base {
  extends: [base]
  dimension: prefix {sql: 'lnk_';;}

  dimension: key {
    group_label: "Data Vault Metadata"
    sql: ${TABLE}.{{ _view._name | remove_first: ${prefix} }} ;;
    hidden: yes
  }

  set: set_details_base {fields:[key, rsrc, ldts_raw]}
}
