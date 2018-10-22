include: "base.sat_base.view.lkml"
view: sat_take {
  extends: [sat_base]
  sql_table_name: DATAVAULT.SAT_TAKE ;;

  set: set_details {fields:[startedat_raw]}

  dimension_group: startedat {
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
    sql: ${TABLE}."STARTEDAT" ;;
  }

  dimension: take_hash {
    type: string
    sql: ${TABLE}."TAKE_HASH" ;;
  }

}
