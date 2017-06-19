view: funding {

  dimension: id {
    primary_key: yes
    description: "Unique ID for each funding record"
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: permalink {
    hidden: yes
    type: string
    sql: ${TABLE}.permalink ;;
  }

  dimension: round_code {
    hidden: yes
    type: string
    sql: ${TABLE}.round_code ;;
  }

  dimension: source_description {
    description: "Description of funding source"
    type: string
    sql: ${TABLE}.source_description ;;
  }

  dimension: raised_amount {
    description: "Amount of funding"
    type: number
    sql: ${TABLE}.raised_amount ;;
  }

  dimension: raised_currency_code {
    description: "Currency type"
    type: number
    sql: ${TABLE}.raised_currency_code ;;
  }

  dimension_group: funded_at {
    description: "Date funding occurred"
    type: time
    timeframes: [date, week, month, year]
    sql: ${TABLE}.funded_at ;;
  }

  measure: count {
    description: "Use this for counting dimensions"
    type: count
    # drill_fields: []
  }
}
