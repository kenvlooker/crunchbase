view: acquisitions {

  dimension: acquired_permalink {
    hidden: yes
    primary_key: yes
    type: string
    sql: ${TABLE}.acquired_permalink ;;
  }

  dimension: acquired_by_permalink {
    hidden: yes
    type: string
    sql: ${TABLE}.acquired_by_permalink ;;
  }

  dimension: price_amount {
    description: "Purchase price"
    type: number
    sql: ${TABLE}.price_amount ;;
    value_format_name: decimal_2
  }

  dimension: currency {
    description: "Currency code"
    type: string
    sql: ${TABLE}.currency ;;
  }

  dimension_group: acquired_at {
    description: "Date acquisition occurred"
    type: time
    timeframes: [date, week, month, year]
    sql: ${TABLE}.acquired_at ;;
  }

  measure: acquisition_count {
    description: "Number of acquisitions"
    type: count
  }

  measure: total_price {
    description: "Total price of acquisitions"
    type: sum
    sql: ${price_amount} ;;
    value_format_name: usd
  }

  measure: average_price {
    description: "Average price of acquisitions"
    type: average
    sql: ${price_amount} ;;
    value_format_name: usd
  }

}
