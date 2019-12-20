# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

women = Category.create(:name=>"レディース")
men = Category.create(:name=>"メンズ")
women_tops = women.children.create(:name=>"トップス")
women_jacket = women.children.create(:name=>"ジャケット/アウター")
men_tops = men.children.create(:name=>"トップス")
men_jacket = men.children.create(:name=>"ジャケット/アウター")
women_tops.children.create([{:name=>"Tシャツ/カットソー(半袖/袖なし)"}, 
                            {:name=>"Tシャツ/カットソー(七分/長袖)"},
                            {:name=>"シャツ/ブラウス(半袖/袖なし)"},
                            {:name=>"その他"}])
women_jacket.children.create([{:name=>"テーラードジャケット"},
                              {:name=>"ノーカラージャケット"},
                              {:name=>"Gジャン/デニムジャケット"},
                              {:name=>"その他"}])
men_tops.children.create([{:name=>"Tシャツ/カットソー(半袖/袖なし)"}, 
                          {:name=>"Tシャツ/カットソー(七分/長袖)"},
                          {:name=>"シャツ"},
                          {:name=>"その他"}])
men_jacket.children.create([{:name=>"テーラードジャケット"},
                            {:name=>"ノーカラージャケット"},
                            {:name=>"Gジャン/デニムジャケット"},
                            {:name=>"その他"}])