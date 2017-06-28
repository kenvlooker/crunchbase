view: employment {

  dimension: id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: permalink {
    hidden: yes
    type: string
    sql: ${TABLE}.permalink ;;
  }
  dimension: company_permalink {
    hidden: yes
    type: string
    sql: ${TABLE}.company_permalink ;;
  }
  dimension: is_past {
    hidden: yes
    type: number
    sql: ${TABLE}.is_past ;;
    }

  dimension: is_this_job_in_the_past {
    description: "Is this investor a company?"
    type: yesno
    sql:  ${is_past} = 1 ;;
  }

  dimension: title {
    description: "Job title"
    type: string
    sql: ${TABLE}.title ;;
  }
  measure: employment_count {
    description: "Number of employments"
    type: count
    # drill_fields: []
  }
}
