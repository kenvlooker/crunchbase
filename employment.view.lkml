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

  dimension: past_yesno {
    label: "Is this job in the past?"
    description: "Is this investor a company?"
    type: yesno
    sql:  ${is_past} = 1 ;;
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
