include: "base.sat_base.view.lkml"
view: sat_student {
  extends: [sat_base]
  sql_table_name: DATAVAULT.SAT_STUDENT ;;

  set: set_details {fields:[sso_guid]}

  dimension: email {
    type: string
    sql: ${TABLE}."EMAIL" ;;
  }

  dimension: sso_guid {
    type: string
    sql: ${TABLE}."SSO_GUID" ;;
  }

  dimension: student_hash {
    type: string
    sql: ${TABLE}."STUDENT_HASH" ;;
  }
}
