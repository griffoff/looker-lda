connection: "snowflake_lda"

include: "hub*.view.lkml"         # include all views in this project
include: "sat*.view.lkml"         # include all views in this project
include: "lnk*.view.lkml"         # include all views in this project

include: "/cube/dim_product.view"
include: "/cube/dim_course.view"



explore: hub_coursesection {
  #which product is the course
  join: lnk_coursesection_product {
    sql_on: ${hub_coursesection.coursekeyhash} = ${lnk_coursesection_product.coursekeyhash} ;;
    relationship: one_to_one
  }
  join: hub_product {
    sql_on: ${lnk_coursesection_product.producthash} = ${hub_product.producthash} ;;
    relationship: many_to_one
  }
  join: sat_product {
    sql_on: ${hub_product.producthash} = ${sat_product.producthash}
          and ${sat_product.is_current};;
    relationship: one_to_one
  }
  # which students are in this class
  join: lnk_coursesection_student {
    sql_on: ${hub_coursesection.coursekeyhash} = ${lnk_coursesection_student.coursekeyhash} ;;
    relationship: one_to_many
  }
  join: hub_student {
    sql_on: ${lnk_coursesection_student.userguidhash} = ${hub_student.userguidhash} ;;
    relationship: many_to_one
  }
  # which assignments are in this class
  join: lnk_coursesection_assignment {
    sql_on: ${hub_coursesection.coursekeyhash} = ${lnk_coursesection_assignment.coursekeyhash}  ;;
    relationship: one_to_many
  }
  join: hub_assignment {
    sql_on: ${lnk_coursesection_assignment.assignmenthash} = ${hub_assignment.assignmenthash} ;;
    relationship: many_to_one
  }
  # which students did which assignments
  join: lnk_student_assignment {
    sql_on: ${hub_student.userguidhash} = ${lnk_student_assignment.userguidhash}
            and ${hub_assignment.assignmenthash} = ${lnk_student_assignment.assignmenthash};;
    relationship: one_to_many
  }

  # which items are in which assignments
  join: lnk_assignment_item {
    sql_on: ${hub_assignment.assignmenthash} = ${lnk_assignment_item.assignmenthash} ;;
    relationship: one_to_many
  }
  join: hub_item {
    sql_on: ${lnk_assignment_item.itemidhash} = ${hub_item.itemidhash} ;;
    relationship: many_to_one
  }
  # which students answered which items
  join: lnk_student_take_item_course {
    sql_on: ${hub_student.userguidhash} = ${lnk_student_take_item_course.userguidhash}
            and ${hub_item.itemidhash} = ${lnk_student_take_item_course.itemidhash};;
    relationship: one_to_many
  }
  join: sat_student_take_item_course {
    sql_on: ${lnk_student_take_item_course.userguidtakeitemidcoursekeyhash} = ${sat_student_take_item_course.userguidtakeitemidcoursekeyhash}
          and ${sat_student_take_item_course.is_current};;
          relationship: one_to_one
  }
#   join: lnk_student_take {
#     sql_on:  ;;
#   }

#   join: hub_take {
#     sql_on: ${lnk_student_take_item.takehash} = ${hub_take.takehash} ;;
#     relationship: many_to_one
#   }

}

explore: scores {
  from: sat_student_take_item_course
  view_name: sat_student_take_item_course
  sql_always_where: ${sat_student_take_item_course.is_current} ;;

  # which students answered which items
  join: lnk_student_take_item_course {
    sql_on: ${sat_student_take_item_course.userguidtakeitemidcoursekeyhash} = ${lnk_student_take_item_course.userguidtakeitemidcoursekeyhash};;
    relationship: one_to_many
  }

  join: hub_item {
    sql_on: ${lnk_student_take_item_course.itemidhash} = ${hub_item.itemidhash};;
    relationship: one_to_one
  }

  join: hub_student {
    sql_on: ${lnk_student_take_item_course.userguidhash} = ${hub_student.userguidhash} ;;
    relationship: many_to_one
  }

  join: hub_take {
    sql_on: ${lnk_student_take_item_course.takehash} = ${hub_take.takehash} ;;
    relationship: many_to_one
  }

  join: lnk_assignment_item {
    sql_on: ${lnk_student_take_item_course.itemidhash} = ${lnk_assignment_item.itemidhash} ;;
    relationship: one_to_many
  }

  join: lnk_coursesection_assignment {
    sql_on: ${lnk_assignment_item.assignmenthash} = ${lnk_coursesection_assignment.assignmenthash} ;;
    relationship: many_to_one
  }

  join: lnk_coursesection_student {
    sql_on: ${lnk_student_take_item_course.userguidhash} = ${lnk_coursesection_student.userguidhash} ;;
    relationship: many_to_many
  }

  join: lnk_coursesection_product {
    sql_on: ${lnk_student_take_item_course.coursekeyhash} = ${lnk_coursesection_product.coursekeyhash} ;;
    relationship: many_to_one
  }

  join: sat_product {
    sql_on: ${lnk_coursesection_product.producthash} = ${sat_product.producthash} ;;
    relationship: many_to_one
  }

  join: hub_coursesection {
    sql_on: ${hub_coursesection.coursekeyhash} = ${lnk_coursesection_product.coursekeyhash} ;;
    relationship: many_to_one
  }

  join: dim_course {
    sql_on: ${hub_coursesection.coursekey} = ${dim_course.coursekey} ;;
    relationship: one_to_one
    }
  join: dim_product {
    sql_on: ${dim_course.productid} = ${dim_product.productid} ;;
    relationship: many_to_one
    }
}

explore: hub_institution {
  join: sat_institution {
    sql_on: ${hub_institution.institutionhash} = ${sat_institution.institutionhash}
    and ${sat_institution.is_current};;
    relationship: one_to_one
  }
}

explore: hub_productcode {
  join: sat_productcode {
    sql_on: ${hub_productcode.productcodehash} = ${sat_productcode.productcodehash}
          and ${sat_productcode.is_current};;
      relationship: one_to_one
  }
  join: lnk_itemname_productcode {
    sql_on: ${hub_productcode.productcodehash} = ${lnk_itemname_productcode.productcodehash} ;;
    relationship: one_to_many
  }
  join: sat_itemname_productcode {
    sql_on: ${lnk_itemname_productcode.itemnameproductcodehash} = ${sat_itemname_productcode.itemnameproductcodehash}
          and ${sat_itemname_productcode.is_current};;
          relationship: one_to_one
  }
  join: hub_itemname {
    sql_on: ${lnk_itemname_productcode.itemnamehash} = ${hub_itemname.itemnamehash} ;;
    relationship: many_to_one
  }

}
