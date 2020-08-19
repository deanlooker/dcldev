view: orders_date_filter {
  sql_table_name: demo_db.orders;;

  filter: date_filter {
    label: "Date Range (Limited to 365 days prior to end date)"
    type: date
    default_value: "1 years"
  }

  dimension: date_filter_start_dim {
    hidden: yes
    type: date
    sql: {% date_start date_filter %}
      ;;
  }

  dimension: date_filter_end_dim {
    hidden:  yes
    type: date
    sql: {% date_end date_filter %};;
  }

  dimension: date_range {
    label: "Date Range"
    description: "Selected range after logic is applied to limit to 365 days"
    type: string
    sql: concat(cast(${date_filter_start_dim} AS CHAR), " - ", cast(${date_filter_end_dim} AS CHAR)) ;;
    html: <div>{{value}}</div> </br>
      <div> Note: filter will only go back maximum 365 days from end date selected!</div>;;
  }

  dimension_group: created {
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
    sql: ${TABLE}.created_at ;;
    datatype: timestamp
  }

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  measure: distinct_users {
    type: count_distinct
    sql: ${user_id};;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;

  }

  measure: count {
    type: count
  }


}
