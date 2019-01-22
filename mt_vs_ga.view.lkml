view: mt_vs_ga {
  # Or, you could make this view a derived table, like this:
  derived_table: {
    sql:
  SELECT
    case
      when GA.GA_time IS NULL then 'MT'
      when MT.event_time IS NULL then 'GA'
      else 'BOTH'
    end AS src
  , coalesce(GA.GA_local_time_from_json, MT.event_time) AS time
  , coalesce(GA.eventcategory, MT.event_category) AS category
  , coalesce(GA.GA_userSSOGuid, MT.user_identifier) AS user_id
  , GA.GA_event
  FROM
    LDA.DELETE_DVTEST.Interactions_GA_201807 as GA
  FULL OUTER JOIN
    LDA.DELETE_DVTEST.Interactions_MT_201807 AS MT
  ON      datediff(second, GA.GA_local_time_from_json, MT.event_time) = 0
      and GA.eventcategory = MT.event_category
      --and GA.EVENTACTION = MT.EVENT_ACTION
      and GA.GA_userSSOGuid = MT.user_identifier

  where time is    not null and
        user_id is not null
  ;;
  }

  # Define your dimensions and measures here, like this:
  dimension: Source {
    description: "Unique ID for each user"
    type: string
    sql: ${TABLE}.src ;;
  }

  dimension: user_id {
    description: "Unique ID for each user"
    type: string
    sql: ${TABLE}.user_id ;;
  }

  dimension: Category {
    description: "The activity category"
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: Event {
    description: "Event from GA.DATALAYER"
    type: string
    sql: ${TABLE}.GA_event ;;
  }

  dimension_group: Time {
    description: "The activity time"
    type: time
    timeframes: [time, minute10]
    sql: ${TABLE}.time ;;
  }

  measure: count {
    type: count
    drill_fields:[]
    #sql: ${TABLE}.time ;;
  }

}
