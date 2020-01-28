include: "//@{CONFIG_PROJECT_NAME}/break_type.view.lkml"

view: break_type {
  extends: [break_type_config]
}

view: break_type {
  sql_table_name: Square.BREAK_TYPE ;;
  drill_fields: [id]

  dimension: pk {
    hidden: yes
    primary_key: yes
    sql: CONCAT(CAST(${id} AS STRING), CAST(${location_id} AS STRING)) ;;
  }

  dimension: id {
    hidden: yes
    type: number
    sql: ${TABLE}.id ;;
    description: "UUID for this object."
  }

  dimension: break_name {
    type: string
    sql: ${TABLE}.break_name ;;
    description: "A human-readable name for this type of break. Will be displayed to employees in Square products."
  }

  dimension: expected_duration {
    label: "Break Expected Duration"
    type: number
    sql: ${TABLE}.expected_duration ;;
    description: "Format: RFC-3339 P[n]Y[n]M[n]DT[n]H[n]M[n]S. The expected length of this break. Precision below minutes is truncated."
  }

  dimension: is_paid {
    label: "Break Is Paid?"
    type: yesno
    sql: ${TABLE}.is_paid ;;
    description: "Whether this break counts towards time worked for compensation purposes."
  }

  dimension: location_id {
    hidden: yes
    type: number
    sql: ${TABLE}.location_id ;;
    description: "The ID of the business location this type of break applies to."
  }

  dimension: version {
    label: "Break Version"
    type: number
    sql: ${TABLE}.version ;;
    description: "Used for resolving concurrency issues; request will fail if version provided does not match server version at time of request. If a value is not provided, Square's servers execute a \"blind\" write; potentially  overwriting another writer's data."
  }

  dimension_group: created {
    label: "Break Created At"
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
    sql: ${TABLE}.created_at ;;
    description: "A read-only timestamp in RFC 3339 format."
  }

  dimension_group: updated {
    label: "Break Updated At"
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
    sql: ${TABLE}.updated_at ;;
    description: "A read-only timestamp in RFC 3339 format."
  }
}
