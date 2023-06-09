# The name of this view in Looker is "New York Citibike"
view: new_york_citibike {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `ryancustomerhosted.testing.new_york_citibike`
    ;;

  dimension: bikeid {
    type: number
    value_format_name: id
    sql: ${TABLE}.bikeid ;;
    primary_key: yes
  }

  dimension: end_station_id {
    type: number
    sql: ${TABLE}.end_station_id ;;
  }

  dimension: end_station_latitude {
    type: number
    sql: ${TABLE}.end_station_latitude ;;
  }

  dimension: end_station_longitude {
    type: number
    sql: ${TABLE}.end_station_longitude ;;
  }

  dimension: end_station_name {
    type: string
    sql: ${TABLE}.end_station_name ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: start_station_id {
    type: number
    sql: ${TABLE}.start_station_id ;;
  }

  dimension: start_station_latitude {
    type: number
    sql: ${TABLE}.start_station_latitude ;;
  }

  dimension: start_station_longitude {
    type: number
    sql: ${TABLE}.start_station_longitude ;;
  }

  dimension: start_station_name {
    type: string
    sql: ${TABLE}.start_station_name ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: starttime {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.starttime ;;
  }

  dimension_group: stoptime {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.stoptime ;;
  }

  dimension: tripduration {
    type: number
    sql: ${TABLE}.tripduration ;;
  }

  dimension: usertype {
    type: string
    sql: ${TABLE}.usertype ;;
  }

  measure: count {
    type: count
    drill_fields: [start_station_name, end_station_name]
    description: "Count of rows in the underlying database table"
  }

  measure: unique_bikes {
    type: count_distinct
    sql: ${bikeid}  ;;
    description: "Count distinct of the bikeid"
  }

  measure: unique_bikes_last_7_days {
    type: count_distinct
    sql: ${bikeid} ;;
    filters: [starttime_date: "7 days",stoptime_date: "-NULL"]
    description: "Count distinct of the bikeid, filtered for where the starttime_date is 7 days ago and stoptime_date is not null"
  }

  measure: custom_average_duration {
    type: average
    sql: ${tripduration}  ;;
    description: "Average of tripduration"
  }

  measure: duration_per_bike {
    type: number
    sql: ${custom_average_duration} / ${unique_bikes} ;;
    description: "Divides custom_average_duration by unique_bikes"
  }

}
