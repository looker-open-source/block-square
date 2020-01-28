include: "//@{CONFIG_PROJECT_NAME}/*/location.view.lkml"

view: location {
  extends: [location_config]
}

view: location_core {
  sql_table_name: @{SCHEMA_NAME}.LOCATION ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    description: "Read only The Square-issued ID of the location."
  }

  dimension: address {
    type: string
    sql: ${TABLE}.address ;;
    description: "The physical address of the location."
  }

  dimension: business_name {
    type: string
    sql: ${TABLE}.business_name ;;
    description: "The business name of the location This is the name visible to the customers of the location. For example, this name appears on customer receipts."
  }

  dimension: capabilities {
    type: string
    sql: ${TABLE}.capabilities ;;
    description: "Read only The Square features that are enabled for the location."
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
    description: "Read only The country of the location, in ISO 3166-1-alpha-2 format."
  }

  dimension: currency {
    type: string
    sql: ${TABLE}.currency ;;
    description: "Read only The currency used for all transactions at this location, in ISO 4217 format."
  }

  dimension: language_code {
    type: string
    sql: ${TABLE}.language_code ;;
    description: "The language associated with the location, in BCP 47 format."
  }

  dimension: merchant_id {
    type: number
    sql: ${TABLE}.merchant_id ;;
    description: "Read only The ID of the merchant that owns the location."
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
    description: "The name of the location. This information appears in the dashboard as the nickname."
  }

  dimension: phone_number {
    type: string
    sql: ${TABLE}.phone_number ;;
    description: "The phone number of the location in human readable format."
  }

  dimension: status {
    type: yesno
    sql: ${TABLE}.status ;;
    description: "The status of the location, either active or inactive."
  }

  dimension: timezone {
    type: string
    sql: ${TABLE}.timezone ;;
    description: "The IANA Timezone identifier for the timezone of the location."
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
    description: "The type of the location, either physical or mobile."
  }

  dimension: website_url {
    type: string
    sql: ${TABLE}.website_url ;;
    description: "The website URL of the location."
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
    sql: ${TABLE}.created_at ;;
    description: "The time when the location was created, in RFC 3339 format."
  }

  measure: count {
    type: count
    drill_fields: [id, business_name, name]
  }
}