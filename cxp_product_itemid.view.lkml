view: cxp_product_itemid {
  derived_table: {
    sql: select
        hub_productcode.productcode as Productcode
       , hub_itemid.itemid as ItemID
       , SAT_TAKE.Score as Score
       , SAT_TAKE.take_time as Submit
      from
        lda.datavaultcxp.SAT_TAKE
      left outer join lda.datavaultcxp.lnk_take on lnk_take.lnk_takehash = sat_take.lnk_takehash
      left outer join lda.datavaultcxp.hub_productcode as hub_productcode on hub_productcode.productcodehash = lnk_take.productcodehash
      left outer join lda.datavaultcxp.hub_itemid on hub_itemid.itemidhash = lnk_take.itemidhash  ;;
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

  dimension: productcode {
    type: string
    sql: ${TABLE}."PRODUCTCODE" ;;
  }

  dimension: itemid {
    type: string
    sql: ${TABLE}."ITEMID" ;;
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
    fields: [productcode, itemid, score, submit_time]
  }
}
