crumb :root do
  # binding.pry
  link "Home", root_path
end

crumb :items do
  link "商品詳細", item_path(params[:id])
  parent :root
end

crumb :item do
  link "商品詳細", item_path(params[:item_id])
  parent :root
end

crumb :purchases do
  link "商品購入",  new_item_purchase_path
  parent :item
end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).