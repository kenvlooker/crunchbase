view: people {

  dimension: permalink {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.permalink ;;
  }

  dimension: name {
    description: "Name"
    type: string
    sql: CONCAT(${TABLE}.first_name,' ',${TABLE}.last_name) ;;
  }

#  dimension: last_name {
#    description: "Last name"
#    type: string
#    sql: ${TABLE}.last_name ;;
#  }

  measure: people_count {
    description: "Number of people"
    type: count
    # drill_fields: []
  }
}
