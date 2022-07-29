view: offices {

  dimension: id {
    primary_key: yes
    hidden: yes
    description: "Unique ID for office"
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: country_code {
    description: "Country"
    type: string
    sql: ${TABLE}.country_code ;;
  }

  dimension: state {
    description: "State"
    map_layer_name: us_states
    type: string
    sql: ${TABLE}.state_code ;;
  }

  dimension: city {
    description: "City"
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: company_permalink {
    hidden: yes
    type: string
    sql: ${TABLE}.company_permalink ;;
  }

  measure: office_count {
    description: "Number of offices"
    type: count
    # drill_fields: []
  }
}
