view: investments {

  dimension: id {
    primary_key: yes
    hidden: yes
    description: "Unique ID for each investment record"
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: investor_permalink {
    hidden: yes
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
#    label: "Is Company"
    hidden: yes
#    description: "Is this investor a company?"
    type: yesno
    sql:  ${is_company} = 1 ;;
  }
}
