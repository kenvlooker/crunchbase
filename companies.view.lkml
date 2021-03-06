view: companies {

 dimension: permalink {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.permalink ;;
 }

  dimension: name {
    description: "Company name"
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: crunchbase_url {
    description: "URL for company page in Crunchbase"
    type: string
    sql: ${TABLE}.crunchbase_url ;;
  }

  dimension: homepage_url {
    description: "Company web site URL"
    type: string
    sql: ${TABLE}.homepage_url ;;
  }

  dimension: blog_url {
    description: "URL for company blog"
    type: string
    sql: ${TABLE}.blog_url ;;
  }

  dimension: twitter_username {
    description: "Company Twitter account"
    type: string
    sql: ${TABLE}.twitter_username ;;
  }

  dimension: category_code {
    type: string
    sql: ${TABLE}.category_code ;;
  }

  dimension: number_of_employees {
    description: "Number of employees at company"
    type: number
    sql: ${TABLE}.number_of_employees ;;
  }

  dimension: number_employees_tier {
    type:  tier
    tiers: [ 50, 500, 5000, 50000]
    style: classic
    sql:  ${number_of_employees} ;;
  }

  dimension_group: founded_at {
    description: "Date company was founded"
    type: time
    timeframes: [date, week, month, year]
    sql: ${TABLE}.founded_at ;;
  }

  dimension: email_address{
    description: "Email address for info at company"
    type: string
    sql: ${TABLE}.email_address ;;
  }

  dimension: phone_number {
    description: "Company primary phone number"
    type: string
    sql: ${TABLE}.phone_number ;;
  }

  dimension: description {
    description: "Company description"
    type: string
    sql: ${TABLE}.description ;;
  }

#  dimension_group: record_created_at {
#    description: "Date and time company record created"
#    type: time
#    timeframes: [date, week, month, year]
#    sql: ${TABLE}.created_at ;;
#  }

#  dimension_group: record_updated_at {
#    description: "Date an time company record was last updated"
#    type: time
#    timeframes: [date, week, month, year]
#    sql: ${TABLE}.updated_at ;;
#  }

#  dimension: full_record {
#    description: " "
#    type: number
#    sql: ${TABLE}.full_record ;;
#  }

  measure: companies_count {
   description: "Number of companies"
   type: count
   # drill_fields: []
  }
  measure: average_number_employees {
    type:  average
    description: "Average # of employees"
    sql: ${number_of_employees} ;;
    value_format_name: decimal_0
  }

}
