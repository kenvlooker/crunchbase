view: investments {

  dimension: id {
    primary_key: yes
    hidden: yes
    description: "Unique ID for each investment record"
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: investor_permalink {
    label: "Investor name"
    type: string
    sql: ${TABLE}.investor_permalink ;;
  }

  dimension: funding_id {
    hidden: yes
    type: number
    sql: ${TABLE}.funding_id ;;
  }

  dimension: is_company {
    hidden: yes
    type: number
    sql: ${TABLE}.is_company ;;
    }

  dimension: company_yesno {
    label: "Is Company"
    description: "Is this investor a company?"
    type: yesno
    sql:  ${is_company} = 1 ;;
  }

  measure: count {
    description: "Use this for counting dimensions"
    type: count
    # drill_fields: []
  }
}
