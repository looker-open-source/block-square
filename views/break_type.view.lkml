view: break_type {
  sql_table_name: Square.BREAK_TYPE ;;
  drill_fields: [id]

  dimension: pk {
    hidden: yes
    primary_key: yes
    sql: CONCAT(${id}, ${location_id}) ;;
  }

  dimension: id {
    hidden: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: break_name {
    type: string
    sql: ${TABLE}.break_name ;;
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
  }

  dimension: expected_duration {
    label: "Break Expected Duration"
    type: number
    sql: ${TABLE}.expected_duration ;;
  }

  dimension: is_paid {
    label: "Break Is Paid?"
    type: yesno
    sql: ${TABLE}.is_paid ;;
  }

  dimension: location_id {
    hidden: yes
    type: number
    sql: ${TABLE}.location_id ;;
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
  }

  dimension: version {
    label: "Break Version"
    type: number
    sql: ${TABLE}.version ;;
  }

}
