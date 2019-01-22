view: excluded_users {
  sql_table_name: DELETE_DVTEST.EXCLUDED_USERS ;;

dimension: user_sso_guid {
    type: string
    sql: ${TABLE}."USER_SSO_GUID" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
