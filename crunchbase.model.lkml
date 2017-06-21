connection: "crunchbase"

include: "*.view.lkml"         # include all views in this project
include: "*.dashboard.lookml"  # include all dashboards in this project

label: "VC Funded Companies"

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
explore: companies {
 label: "All Company Data"

  join: offices {
    type: left_outer
    relationship: one_to_many
    sql_on: ${companies.permalink} = ${offices.company_permalink} ;;
  }

  join: ipo {
    type: left_outer
    relationship: one_to_one
    sql_on: ${companies.permalink} = ${ipo.company_permalink} ;;
  }

  join: funding {
    type: left_outer
    relationship: one_to_many
    sql_on: ${companies.permalink} = ${funding.permalink} ;;
  }

  join: investments {
   type: left_outer
   relationship: one_to_many
   sql_on: ${funding.id} = ${investments.funding_id} ;;
 }

  join: investing_people {
    from: people
    type: left_outer
    relationship: one_to_one
    sql_on: ${investments.investor_permalink} = ${investing_people.permalink} AND ${investments.is_company} = 0  ;;
  }

  join: investing_companies {
    from: companies
    type: left_outer
    relationship: one_to_one
    sql_on: ${investments.investor_permalink} = ${investing_companies.permalink} AND ${investments.is_company} = 1  ;;
  }

  join: competitions {
    view_label: "Competitors"
    type: left_outer
    relationship: one_to_many
    sql_on: ${companies.permalink} = ${competitions.permalink}  ;;
  }

  join: acquisitions {
    view_label: "Acquiring Company"
    type: left_outer
    relationship: one_to_many
    sql_on: ${companies.permalink} = ${acquisitions.acquired_by_permalink}  ;;
 }

  join: employment {
    type: left_outer
    relationship: one_to_many
    sql_on: ${companies.permalink} = ${employment.company_permalink} ;;
  }

  join: employed_people {
    from: people
    type: left_outer
    relationship: many_to_one
    sql_on: ${employment.permalink} = ${employed_people.permalink} ;;
  }

}

explore: funding {
  label: "Funding and Investments"
  join: funded_companies {
    from: companies
    type: left_outer
    relationship: many_to_one
    sql_on: ${funding.permalink} = ${funded_companies.permalink} ;;
  }

  join: investments {
    type: left_outer
    relationship: many_to_many
    sql_on: ${funding.id} = ${investments.funding_id} ;;
  }

  join: people {
    view_label: "Investing people"
    type: left_outer
    relationship: many_to_many
    sql_on: ${people.permalink} = ${investments.investor_permalink} ;;
  }

  join: investing_companies {
    from: companies
    type: left_outer
    relationship: many_to_many
    sql_on: ${investing_companies.permalink} = ${investments.investor_permalink} ;;
  }

}

explore: employment {
  label: "Employment Records"

  join: people {
    type: left_outer
    relationship: many_to_one
    sql_on: ${employment.permalink} = ${people.permalink} ;;
  }

  join: companies {
    type: left_outer
    relationship: many_to_one
    sql_on: ${employment.company_permalink} = ${companies.permalink} ;;
  }

}
