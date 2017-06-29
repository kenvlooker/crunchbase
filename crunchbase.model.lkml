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
    view_label: "Companies"
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
    view_label: "Investors: People"
    from: people
    type: left_outer
    relationship: one_to_one
    sql_on: ${investments.investor_permalink} = ${investing_people.permalink} AND ${investments.is_company} = 0  ;;
  }

  join: investing_companies {
    view_label: "Investors: Companies"
    from: companies
    type: left_outer
    relationship: one_to_one
    sql_on: ${investments.investor_permalink} = ${investing_companies.permalink} AND ${investments.is_company} = 1  ;;
  }

  join: competitions {
    view_label: "Competitors"
    type: left_outer
    relationship: one_to_many
    sql_on: ${companies.permalink} = ${competitions.competitor_permalink}  ;;
  }

  join: competing_company_info{
    from: companies
    view_label: "Competitors"
    type: left_outer
    relationship: one_to_one
    sql_on: ${competitions.competitor_permalink} =  ${competing_company_info.permalink};;
  }

  join: acquired {
    from: "acquisitions"
    view_label: "Acquired Companies"
    type: left_outer
    relationship: one_to_one
    sql_on: ${companies.permalink} = ${acquired.acquired_by_permalink}  ;;
  }

  join: acquired_company_info{
    from: companies
    view_label: "Acquired Companies"
    type: left_outer
    relationship: one_to_one
    sql_on: ${acquired.acquired_permalink} =  ${acquired_company_info.permalink};;
  }

  join: acquiring_company{
    from: "acquisitions"
    view_label: "Parent Companies"
    type: left_outer
    relationship: one_to_many
    sql_on: ${companies.permalink} = ${acquiring_company.acquired_permalink}  ;;
  }

  join: acquiring_company_info{
    from: companies
    view_label: "Parent Companies"
    type: left_outer
    relationship: one_to_one
    sql_on: ${acquired.acquired_by_permalink} =  ${acquiring_company_info.permalink};;
  }
    join: jobs {
    from: employment
    type: left_outer
    relationship: one_to_many
    sql_on: ${companies.permalink} = ${jobs.company_permalink} ;;
  }

  join: people {
    from: people
    type: left_outer
    relationship: many_to_one
    sql_on: ${jobs.permalink} = ${people.permalink} ;;
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
    relationship: one_to_many
    sql_on: ${funding.id} = ${investments.funding_id} ;;
  }

  join: investing_people {
    from: people
    view_label: "Investors: People"
    type: left_outer
    relationship: one_to_one
    sql_on: ${investments.investor_permalink} = ${investing_people.permalink} AND ${investments.is_company} = 0  ;;
  }

  join: investing_companies {
    from: companies
    view_label: "Investors: Companies"
    type: left_outer
    relationship: one_to_one
    sql_on: ${investments.investor_permalink} = ${investing_companies.permalink} AND ${investments.is_company} = 1  ;;
  }

}

explore: jobs {
  from: employment
  label: "Employment Records"

  join: people {
    type: left_outer
    relationship: many_to_one
    sql_on: ${jobs.permalink} = ${people.permalink} ;;
  }

  join: companies {
    type: left_outer
    relationship: many_to_one
    sql_on: ${jobs.company_permalink} = ${companies.permalink} ;;
  }

}
