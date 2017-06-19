view: employment {

  dimension: id {
    primary_key: yes
    description: "Unique ID for each employment record"
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: permalink {
    label: "Employee name"
    type: string
    sql: ${TABLE}.permalink ;;
  }
  dimension: company_permalink {
    label: "Company name"
    type: string
    sql: ${TABLE}.company_permalink ;;
  }
  dimension: is_past {
    description: "Is this job in the past?"
    type: number
    sql: ${TABLE}.is_past ;;
    }
  dimension: title {
    description: "Job title"
    type: string
    sql: ${TABLE}.title ;;
  }
  measure: count {
    description: "Use this for counting dimensions"
    type: count
    # drill_fields: []
  }
}
