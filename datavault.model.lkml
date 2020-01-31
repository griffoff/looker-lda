connection: "snowflake_lda"

include: "hub_*.view.lkml"
include: "sal_*.view.lkml"
include: "sat_*.view.lkml"
include: "lnk_*.view.lkml"

include: "/cube/dim_product.view"
include: "/cube/dim_course.view"



explore: scores {
  from: sat_coursesection_student_take_iteminstance_attempt
  view_name: sat_coursesection_student_take_iteminstance_attempt
  sql_always_where: ${sat_coursesection_student_take_iteminstance_attempt.is_current} ;;

  # which students answered which items
  join: lnk_coursesection_student_take_iteminstance_attempt {
    fields: []
    sql_on: ${sat_coursesection_student_take_iteminstance_attempt.coursesection_student_take_iteminstance_attempt_hash} = ${lnk_coursesection_student_take_iteminstance_attempt.coursesection_student_take_iteminstance_attempt_hash};;
    relationship: one_to_one
  }

  join: hub_iteminstance {
    sql_on: ${lnk_coursesection_student_take_iteminstance_attempt.iteminstance_hash} = ${hub_iteminstance.iteminstance_hash};;
    relationship: many_to_one
  }

  join: hub_coursesection {
    sql_on: ${lnk_coursesection_student_take_iteminstance_attempt.coursesection_hash} = ${hub_coursesection.coursesection_hash} ;;
    relationship: many_to_one
  }

  join: hub_student {
    sql_on: ${lnk_coursesection_student_take_iteminstance_attempt.student_hash} = ${hub_student.student_hash} ;;
    relationship: many_to_one
  }

  join: sat_student {
    sql_on: ${lnk_coursesection_student_take_iteminstance_attempt.student_hash} = ${sat_student.student_hash} ;;
    relationship: many_to_one
  }

  join: sat_take {
    sql_on: ${lnk_coursesection_student_take_iteminstance_attempt.take_hash} = ${sat_take.take_hash} ;;
    relationship: many_to_one
  }

  join: lnk_coursesection_product {
    fields: []
    sql_on: ${lnk_coursesection_student_take_iteminstance_attempt.coursesection_hash} = ${lnk_coursesection_product.coursesection_hash} ;;
    relationship: many_to_many
  }

  join: lnk_coursesection_institution {
    fields: []
    sql_on: ${lnk_coursesection_student_take_iteminstance_attempt.coursesection_hash} = ${lnk_coursesection_institution.coursesection_hash} ;;
    relationship: many_to_many
  }

  join: sat_product {
    sql_on: ${lnk_coursesection_product.product_hash} = ${sat_product.product_hash} ;;
    relationship: many_to_one
  }

  join: sat_coursesection {
    sql_on: ${lnk_coursesection_student_take_iteminstance_attempt.coursesection_hash} = ${sat_coursesection.coursesection_hash} ;;
    relationship: many_to_one
  }

  join: sat_institution {
    sql_on: ${lnk_coursesection_institution.institution_hash} = ${sat_institution.institution_hash}
      and ${sat_institution.is_current};;
    relationship: one_to_one
  }

#   join: dim_course {
#     sql_on: ${hub_coursesection.coursekey} = ${dim_course.coursekey} ;;
#     relationship: one_to_one
#     }
#   join: dim_product {
#     sql_on: ${dim_course.productid} = ${dim_product.productid} ;;
#     relationship: many_to_one
#     }
}

explore: hub_institution {
  join: sat_institution {
    sql_on: ${hub_institution.institution_hash} = ${sat_institution.institution_hash}
    and ${sat_institution.is_current};;
    relationship: one_to_one
  }
}

explore: hub_bookcode {
  join: sat_bookcode {
    sql_on: ${hub_bookcode.bookcode_hash} = ${sat_bookcode.bookcode_hash}
          and ${sat_bookcode.is_current};;
      relationship: one_to_one
  }
  join: lnk_iteminstance_bookcode {
    sql_on: ${hub_bookcode.bookcode_hash} = ${lnk_iteminstance_bookcode.bookcode_hash} ;;
    relationship: one_to_many
  }
  join: hub_iteminstance {
    sql_on: ${lnk_iteminstance_bookcode.iteminstance_hash} = ${hub_iteminstance.iteminstance_hash} ;;
    relationship: many_to_one
  }

}
