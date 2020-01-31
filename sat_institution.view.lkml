include: "base.sat_base.view.lkml"
view: sat_institution {
  extends: [sat_base]
  sql_table_name: DATAVAULT.SAT_INSTITUTION ;;

  set: set_details {fields:[institutionname, institutiontype, institutionsubtype, county, district, country]}

  dimension: city {
    type: string
    sql: ${TABLE}."CITY" ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}."COUNTRY" ;;
  }

  dimension: county {
    type: string
    sql: ${TABLE}."COUNTY" ;;
  }

  dimension: district {
    type: string
    sql: ${TABLE}."DISTRICT" ;;
  }

  dimension: institution_hash {
    type: string
    sql: ${TABLE}."INSTITUTION_HASH" ;;
    hidden: yes
  }

  dimension: institutionname {
    type: string
    sql: ${TABLE}."INSTITUTIONNAME" ;;
  }

  dimension: institutionsubtype {
    type: string
    sql: ${TABLE}."INSTITUTIONSUBTYPE" ;;
  }

  dimension: institutiontype {
    type: string
    sql: ${TABLE}."INSTITUTIONTYPE" ;;
  }

}
