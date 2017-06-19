connection: "crunchbase"

include: "*.view.lkml"         # include all views in this project
include: "*.dashboard.lookml"  # include all dashboards in this project

label: "VC Funded Companies"

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
explore: companies {
 join: funding {
   type: left_outer
   relationship: many_to_one
   sql_on: ${funding.permalink} = ${companies.permalink} ;;
 }

 join: investments {
   type: left_outer
   relationship: many_to_many
   sql_on: ${funding.id} = ${investments.funding_id} ;;
 }

 join: offices {
   type: left_outer
   relationship: many_to_one
   sql_on: ${offices.company_permalink} = ${companies.permalink} ;;
 }

 join: ipo {
   type: left_outer
   relationship: one_to_one
   sql_on: ${ipo.company_permalink} = ${companies.permalink} ;;
 }

 join: acquired {
   type: left_outer
   from: acquisitions
   relationship: many_to_one
   sql_on: ${acquired.acquired_permalink} = ${companies.permalink} ;;
 }

 join: acquired_by {
   type: left_outer
   from:  acquisitions
   relationship: many_to_one
   sql_on: ${acquired_by.acquired_by_permalink} = ${companies.permalink} ;;
 }

 join: competitions {
   view_label: "Competitors"
   type: left_outer
   relationship: many_to_one
   sql_on: ${competitions.competitor_permalink} = ${companies.permalink} ;;
 }

  join: employment {
    type: left_outer
    relationship: one_to_many
    sql_on: ${employment.company_permalink} = ${companies.permalink} ;;
  }

  join: people {
    type: left_outer
    relationship: many_to_many
    sql_on: ${employment.permalink} = ${people.permalink} ;;
  }

}

explore: funding {
  join: companies {
    type: left_outer
    relationship: many_to_one
    sql_on: ${funding.permalink} = ${companies.permalink} ;;
  }

  join: investments {
    type: left_outer
    relationship: many_to_many
    sql_on: ${funding.id} = ${investments.funding_id} ;;
  }

  join: ipo {
    type: left_outer
    relationship: one_to_one
    sql_on: ${ipo.company_permalink} = ${companies.permalink} ;;
  }

  join: acquired {
    type: left_outer
    from: acquisitions
    relationship: many_to_one
    sql_on: ${acquired.acquired_permalink} = ${companies.permalink} ;;
  }

  join: acquired_by {
    type: left_outer
    from:  acquisitions
    relationship: many_to_one
    sql_on: ${acquired_by.acquired_by_permalink} = ${companies.permalink} ;;
  }

}

explore: people {

  join: employment {
    type: left_outer
    relationship: many_to_one
    sql_on: ${employment.company_permalink} = ${people.permalink} ;;
  }

  join: companies {
    type: left_outer
    relationship: many_to_one
    sql_on: ${employment.company_permalink} = ${companies.permalink} ;;
  }

}
