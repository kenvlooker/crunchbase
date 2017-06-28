view: competitions {
#  sql_table_name: competitions ;;


  dimension: permalink {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.permalink ;;
  }

  dimension: competitor_permalink {
    hidden: yes
    type: string
    sql: ${TABLE}.competitor_permalink ;;
  }

  measure: competitors_count {
    description: "Number of competitors"
    type: count
    # drill_fields: []
  }
}
