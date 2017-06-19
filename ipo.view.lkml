view: ipo {

  dimension: company_permalink {
    hidden: yes
    type: string
    sql: ${TABLE}.company_permalink ;;
  }

  dimension: stock_symbol {
    description: "Stock symbol"
    type: string
    sql: ${TABLE}.stock_symbol ;;
  }

  dimension: valuation_amount {
    description: "Company valuation at time of IPO"
    type: number
    sql: ${TABLE}.valuation_amount ;;
  }

  dimension_group: public_date {
    description: "Date of IPO"
    type: time
    timeframes: [date, week, month, year]
    sql: ${TABLE}.public_date ;;
  }

  measure: count {
    description: "Use this for counting dimensions"
    type: count
    # drill_fields: []
  }

  measure: sum_ipos {
    description: "Total valuation amount"
    type: sum
    sql: ${valuation_amount} ;;
    value_format_name: usd
  }

  measure: average_ipos {
    description: "Average valuation amount"
    type: average
    sql: ${valuation_amount} ;;
    value_format_name: usd
  }
}
