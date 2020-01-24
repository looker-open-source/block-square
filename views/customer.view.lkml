view: customer {
  sql_table_name: Square.CUSTOMER ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    description: "A unique, Square-assigned object ID."
  }

  dimension: address {
    type: string
    sql: ${TABLE}.address ;;
    description: "The physical address associated with the customer profile."
  }

  dimension: company_name {
    type: string
    sql: ${TABLE}.company_name ;;
    description: "A business name associated with the customer profile."
  }

  dimension: creation_source {
    type: string
    sql: ${TABLE}.creation_source ;;
    description: "A creation source represents the method used to create the customer profile."
  }

  dimension: email_address {
    type: string
    sql: ${TABLE}.email_address ;;
    description: "The email address associated with the customer profile."
  }

  dimension: family_name {
    type: string
    sql: ${TABLE}.family_name ;;
    description: "The family (i.e., last) name associated with the customer profile."
  }

  dimension: given_name {
    type: string
    sql: ${TABLE}.given_name ;;
    description: "The given (i.e., first) name associated with the customer profile."
  }

  dimension: nickname {
    type: string
    sql: ${TABLE}.nickname ;;
    description: "A nickname for the customer profile."
  }

  dimension: note {
    type: string
    sql: ${TABLE}.note ;;
    description: "A custom note associated with the customer profile."
  }

  dimension: phone_number {
    type: string
    sql: ${TABLE}.phone_number ;;
    description: "The 11-digit phone number associated with the customer profile."
  }

  dimension: preference_email_unsubscribed {
    type: yesno
    sql: ${TABLE}.preference_email_unsubscribed ;;
  }

  dimension: reference_id {
    type: number
    sql: ${TABLE}.reference_id ;;
    description: "An optional, second ID used to associate the customer profile with an entity in another system."
  }

  dimension_group: birthday {
    type: time
    timeframes: [
      raw,
      time_of_day,
      hour_of_day,
      day_of_week,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.birthday ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time_of_day,
      hour_of_day,
      day_of_week,
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
    sql: ${TABLE}.updated_at ;;
  }

  dimension_group: cohort_age {
    type: duration
    sql_start: CAST(${created_raw} AS TIMESTAMP) ;;
    sql_end: CURRENT_TIMESTAMP() ;;
    intervals: [month, year]
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  set: detail {
    fields: [
      id,
      given_name,
      company_name,
      nickname,
      family_name,
      tender.count,
      customer_group_association.count,
      customer_card.count
    ]
  }
}
