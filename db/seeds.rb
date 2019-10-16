# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# coding: utf-8

# # 悩みカテゴリ
TroubleCategory.delete_all
TroubleCategory.create(:name => '仕事と家庭の両立')
TroubleCategory.create(:name => '家事全般')
TroubleCategory.create(:name => '育児')
TroubleCategory.create(:name => '嫁姑問題')
TroubleCategory.create(:name => '仕事と育児の両立')
TroubleCategory.create(:name => '貯蓄')
TroubleCategory.create(:name => '介護')
TroubleCategory.create(:name => 'ワンオペ育児')
TroubleCategory.create(:name => '同居')
TroubleCategory.create(:name => '受験')
TroubleCategory.create(:name => 'いじめ')

# # 掲示板カテゴリ
BoardCategory.delete_all
BoardCategory.create(:name => '雑談')
BoardCategory.create(:name => '相談')
BoardCategory.create(:name => '家事')
BoardCategory.create(:name => '育児')
BoardCategory.create(:name => '妊娠')
BoardCategory.create(:name => '仕事')
BoardCategory.create(:name => '日常')
BoardCategory.create(:name => '受験')
BoardCategory.create(:name => '介護')
BoardCategory.create(:name => '節約')
BoardCategory.create(:name => '小学校')


AdminUser.delete_all
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

User.delete_all
User.create!(name: "aaaaaa", email: "aaa@aaa", password: "aaaaaa", password_confirmation: 'aaaaaa', housewife_year: 2) if Rails.env.development?
User.create!(name: "bbbbbb", email: "bbb@bbb", password: "bbbbbb", password_confirmation: 'bbbbbb', housewife_year: 3) if Rails.env.development?

