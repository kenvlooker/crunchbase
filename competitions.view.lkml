view: competitions {

  dimension: permalink {
    label: "Company"
    type: string
    sql: ${TABLE}.permalink ;;
  }

  dimension: competitor_permalink {
    label: "Competitor"
    type: string
    sql: ${TABLE}.competitor_permalink ;;
  }

  measure: count {
    description: "Use this for counting dimensions"
    type: count
    # drill_fields: []
  }
}
