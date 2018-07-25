view: cxp_course {
  derived_table: {
    sql: select
        hub_course.coursekey as Course
        --, hub_itemid.itemid as ItemID
        , SAT_TAKE.Score as Score
        , SAT_TAKE.take_time as Submit
      from lda.datavaultcxp.SAT_TAKE
        left outer join lda.datavaultcxp.lnk_take on lnk_take.lnk_takehash = sat_take.lnk_takehash
        left outer join lda.datavaultcxp.hub_course as hub_course on hub_course.coursekeyhash = lnk_take.coursekeyhash
        --left outer join lda.datavaultcxp.hub_itemid on hub_itemid.itemidhash = lnk_take.itemidhash
    ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: avg_score {
    label: "Average Score"
    type: average
    sql: ${score} ;;
  }

  dimension: course {
    type: string
    sql: ${TABLE}."COURSE" ;;
  }

  dimension: score {
    type: number
    sql: ${TABLE}."SCORE" ;;
  }

  dimension_group: submit {
    type: time
    sql: ${TABLE}."SUBMIT" ;;
  }

  set: detail {
    fields: [course, score, submit_time]
  }
}
