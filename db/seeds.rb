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
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

# ユーザ
User.delete_all
User.create!(name: "みゆう", email: "miyu@gmail.com", password: "111111", password_confirmation: '111111', housewife_year: 4, introduction: "一児の母です！最近は保活してます。よろしくお願いします。")
User.create!(name: "まさん", email: "mai@gmail.com", password: "111111", password_confirmation: '111111', housewife_year: 10, introduction: "次小学校に上がる息子がいますよろしくお願いします。")
User.create!(name: "トントン", email: "tonton@gmail.com", password: "111111", password_confirmation: '111111', housewife_year: 20, introduction: "仕事しながら子育てしてますよろしくお願いします。")
User.create!(name: "晶子", email: "akiko@gmail.com", password: "111111", password_confirmation: '111111', housewife_year: 7, introduction: "よろしくお願いします")
User.create!(name: "りえ", email: "rie@gmail.com", password: "111111", password_confirmation: '111111', housewife_year: 3, introduction: "仲良くしてくださーい")
User.create!(name: "咲", email: "saki@gmail.com", password: "111111", password_confirmation: '111111', housewife_year: 20, introduction: "よろしくです")
User.create!(name: "千春", email: "chiharu@gmail.com", password: "111111", password_confirmation: '111111', housewife_year: 25, introduction: "子育て終わりました。皆さんの相談に乗ります")
User.create!(name: "れいか", email: "reika@gmail.com", password: "111111", password_confirmation: '111111', housewife_year: 13, introduction: "よろしくでーす")

#ユーザの画像
user3 =User.find(1)
user3.image.attach(io: File.open('public/3.png'), filename: '3.png')

user4 =User.find(2)
user4.image.attach(io: File.open('public/4.jpg'), filename: '4.jpg')

user5 =User.find(3)
user5.image.attach(io: File.open('public/5.png'), filename: '5.png')

user6 =User.find(4)
user6.image.attach(io: File.open('public/6.png'), filename: '6.png')

user7 =User.find(5)
user7.image.attach(io: File.open('public/7.jpg'), filename: '7.jpg')

user8 =User.find(6)
user8.image.attach(io: File.open('public/8.jpg'), filename: '8.jpg')

user9 =User.find(7)
user9.image.attach(io: File.open('public/9.png'), filename: '9.png')

user10 =User.find(8)
user10.image.attach(io: File.open('public/10.jpg'), filename: '10.jpg')