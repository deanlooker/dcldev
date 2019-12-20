view: smelookml_dt {
  derived_table: {
    sql: select
        orders.created_at as created,
        orders.id as orderid,
        orders.status as status,
        users.id as userid,
        users.first_name as firstname,
        users.last_name as lastname,
        users.email as email,
        users.age as age,
        users.gender as gender,
        users.state as state
      from
        demo_db_generator.orders
      join
        demo_db_generator.users
      on
        orders.user_id = users.id
      where
        {% condition gender_filter %} gender {% endcondition %}
        and
        {% condition date_filter %} orders.created_at {% endcondition %}
       ;;
  }

  filter: date_filter {
    type: date

  }

  filter: gender_filter {
    type: string
    suggest_dimension: gender
  }

  parameter: order_location {
    type: string
    allowed_value: {
      value: "EU"
    }
      allowed_value: {
        value: "US"
      }
  }

  dimension: date_formatted {
    type: date
    sql: ${created_date} ;;
    html: {% if order_location._parameter_value == "'US'" %}
    {{ rendered_value | date: "%m/%d/%y" }}
    {% elsif order_location._parameter_value == "'EU'" %}
    {{ rendered_value | date: "%d/%m/%y" }}
    {% else %}
    {{ rendered_value }}
    {% endif %};;
}

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension_group: created {
    type: time
    sql: ${TABLE}.created ;;
  }

  dimension: orderid {
    type: number
    value_format_name: id
    sql: ${TABLE}.orderid ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: userid {
    type: number
    value_format_name: id
    sql: ${TABLE}.userid ;;
  }

  dimension: firstname {
    type: string
    sql: ${TABLE}.firstname ;;
  }

  dimension: lastname {
    type: string
    sql: ${TABLE}.lastname ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  set: detail {
    fields: [
      created_time,
      orderid,
      status,
      userid,
      firstname,
      lastname,
      email,
      age,
      gender,
      state
    ]
  }
}
