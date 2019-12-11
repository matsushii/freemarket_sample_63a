crumb :root do
  link "メルカリ", root_path
end

crumb :username do
  link "ユーザー情報", user_path
  parent :root
end

crumb :mypage do
  link "マイページ", user_path(id: current_user.id)
  parent :root
end

crumb :exhibit_items do
  link "出品した商品-出品中", exhibit_items_user_path(id: current_user.id)
  parent :mypage
end

crumb :exhibit_items_trading do
  link "出品した商品-取引中", exhibit_items_trading_user_path(id: current_user.id)
  parent :mypage
end

crumb :exhibit_items_sold do
  link "出品した商品-売却済み", exhibit_items_sold_user_path(id: current_user.id)
  parent :mypage
end

crumb :purchased_trading_items_user do
  link "購入した商品-取引中", purchased_trading_items_user_path(id: current_user.id)
  parent :mypage
end

crumb :profile do
  link "プロフィール", edit_user_path(id: current_user.id)
  parent :mypage
end

crumb :deliver_address_user do
  link "発送元・お届け先住所変更", deliver_address_user_path(id: current_user.id)
  parent :mypage
end

crumb :identification_user do
  link "本人情報の登録", identification_user_path(id: current_user.id)
  parent :mypage
end

crumb :logout do
  link "ログアウト", logout_user_path
  parent :mypage
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