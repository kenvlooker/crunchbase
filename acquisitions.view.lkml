view: acquisitions {

  dimension: acquired_permalink {
    label: "Acquired"
    type: string
    sql: ${TABLE}.acquired_permalink ;;
  }

  dimension: acquired_by_permalink {
    label: "Acquired by"
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
    type: number
    sql: ${TABLE}.currency ;;
  }

  dimension_group: acquired_at {
    description: "Date acquisition occurred"
    type: time
    timeframes: [date, week, month, year]
    sql: ${TABLE}.acquired_at ;;
  }

  measure: count {
    description: "Use this for counting dimensions"
    type: count
  }

  measure: sum_acquisitions {
    description: "Total price of acquisitions"
    type: sum
    sql: ${price_amount} ;;
    value_format_name: usd
  }

}
