view: ipo {

  dimension: company_permalink {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.company_permalink ;;
  }

  dimension: stock_symbol {
    description: "Stock symbol"
    type: string
    sql: ${TABLE}.stock_symbol ;;
  }

  dimension: IPO_valuation_amount {
    label: "IPO Valuation Amount"
    description: "Company valuation at time of IPO"
    type: number
    sql: ${TABLE}.valuation_amount ;;
    value_format_name: usd
  }

  dimension_group: IPO {
    label: "IPO Date"
    description: "Date of IPO"
    type: time
    timeframes: [date, week, month, year]
    sql: ${TABLE}.public_date ;;
  }

  measure: ipo_count {
    label: "IPO Count"
    description: "Number of ipos"
    type: count
    # drill_fields: []
  }
  measure: total_ipos {
    label: "Total IPO Valuation"
    description: "Total valuation amount"
    type: sum
    sql: ${IPO_valuation_amount} ;;
    value_format_name: usd
  }

  measure: average_ipos {
    label: "Average IPO valuation"
    description: "Average valuation amount"
    type: average
    sql: ${IPO_valuation_amount} ;;
    value_format_name: usd
  }
}
