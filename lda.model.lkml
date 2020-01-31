connection: "snowflake_lda"

include: "fivetran_audit.view.lkml"         # include all views in this project

explore: fivetran_audit {}
