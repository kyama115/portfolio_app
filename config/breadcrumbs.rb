crumb :root do
  link 'トップページ'.html_safe, root_path
end

# ショップ一覧ページのパンくず
crumb :shops do
  link "店舗一覧", shops_path
  parent :root
end

# ショップ詳細ページのパンくず
crumb :shop do |shop|
  link shop.name, shop_path(shop)
  parent :shops
end

# レビュー投稿ページのパンくず
crumb :new_review do |shop|
  link "レビュー投稿", new_shop_review_path(shop)
  parent :shop, shop
end

# お気に入り一覧ページのパンくず
crumb :favorites do
  link "お気に入り一覧", favorites_shops_path
  parent :root
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