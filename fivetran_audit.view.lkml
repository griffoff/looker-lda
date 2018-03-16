include: "/core/fivetran.*"

view: fivetran_audit {
 extends: [fivetran_audit_base]
sql_table_name: fivetran_cnow_cxp_analysis.fivetran_audit ;;
}
