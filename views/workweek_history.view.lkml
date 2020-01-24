view: workweek_history {
  sql_table_name: Square.WORKWEEK_HISTORY ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    description: "UUID for this object"
  }

  dimension: start_of_week {
    type: string
    sql: ${TABLE}.start_of_week ;;
    description: "The day of the week on which a business week cuts over for compensation purposes."
  }

  dimension: version {
    type: number
    sql: ${TABLE}.version ;;
    description: "Used for resolving concurrency issues; request will fail if version provided does not match server version at time of request. If not provided, Square executes a blind write; potentially overwriting data from another write."
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Created_at ;;
    description: "A read-only timestamp in RFC 3339 format; presented in UTC"
  }

  dimension_group: start_of_day_local {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.start_of_day_local_time ;;
    description: "The local time at which a business week cuts over. Represented as a string in HH:MM format (HH:MM:SS is also accepted, but seconds are truncated)."
  }

  dimension_group: updated {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Updated_at ;;
    description: "A read-only timestamp in RFC 3339 format; presented in UTC"
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
