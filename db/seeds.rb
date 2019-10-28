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
User.with_deleted.delete_all
User.create(name: "テスト", email: "test@gmail.com", password: "111111", password_confirmation: '111111', housewife_year: 4, introduction: "結婚３年目で１才の子供を保育園に預けながら時短で働いています。最近産休から仕事に復帰しました。子供の夜泣きで寝不足の日々ですが、子供は最高に可愛いです。育児と仕事の両立で忙しいですが、日々充実しています。子育て中のワーママさん、先輩ママさん、仲良くしてください。よろしくお願いいたします。")
User.create(name: "まさん", email: "mai@gmail.com", password: "111111", password_confirmation: '111111', housewife_year: 10, introduction: "来年息子が小学校に上がります。やっと子育ても少し落ち着いてきましたが、働いているので小１の壁が不安です。先輩ママさん仲良くしてくださいっ")
User.create(name: "トントン", email: "tonton@gmail.com", password: "111111", password_confirmation: '111111', housewife_year: 17, introduction: "子供が学校で突然いじめられてしまいました。学校に相談しているのですが、なかなか治らず学校に行くことができません。旦那が単身赴任なので心細いです。")
User.create(name: "晶子", email: "akiko@gmail.com", password: "111111", password_confirmation: '111111', housewife_year: 7, introduction: "今年二人目を出産しました。一人目の子と遊ぶ時間が取れないのが悩みです；")
User.create(name: "りえ", email: "rie@gmail.com", password: "111111", password_confirmation: '111111', housewife_year: 3, introduction: "現在妊活中ですが仕事も忙しく思うように行きません。年齢的にも内心焦っています。家事が苦手で仕事も忙しいので精神的に辛いです。同じ境遇だった先輩ママさんからアドバイスいただきたいです")
User.create(name: "咲", email: "saki@gmail.com", password: "111111", password_confirmation: '111111', housewife_year: 20, introduction: "子供が今年大学受験です。気が早いですが、これが終わったら子育ても終わりだなと思いホッとしている反面悲しいです。子育ても落ち着いてきたので医療事務の資格を取って働こうと思っています。よろしくお願いします")
User.create(name: "千春", email: "chiharu@gmail.com", password: "111111", password_confirmation: '111111', housewife_year: 25, introduction: "今年子供の就職活動が終了し、３人の娘の子育てが終わりました。皆さんの相談に乗ります")
User.create(name: "れいか", email: "reika@gmail.com", password: "111111", password_confirmation: '111111', housewife_year: 13, introduction: "娘が小学校６年生で受験生です。成績が伸び悩んでいて、厳しい状況です。親としてできることを探しにこちらに登録しました。")
User.create(name: "なつみ", email: "natsumi@gmail.com", password: "111111", password_confirmation: '111111', housewife_year: 20, introduction: "")
User.create(name: "なつき", email: "natsuki@gmail.com", password: "111111", password_confirmation: '111111', housewife_year: 25, introduction: "")
User.create(name: "れいな", email: "reina@gmail.com", password: "111111", password_confirmation: '111111', housewife_year: 13, introduction: "")




#ユーザの画像
user1 = User.find(1)
user1.image.attach(io: File.open('public/3.png'), filename: '3.png')

user2 = User.find(2)
user2.image.attach(io: File.open('public/4.jpg'), filename: '4.jpg')

user3 = User.find(3)
user3.image.attach(io: File.open('public/5.png'), filename: '5.png')

user4 = User.find(4)
user4.image.attach(io: File.open('public/6.png'), filename: '6.png')

user5 = User.find(5)
user5.image.attach(io: File.open('public/7.jpg'), filename: '7.jpg')

user6 = User.find(6)
user6.image.attach(io: File.open('public/8.jpg'), filename: '8.jpg')

user7 = User.find(7)
user7.image.attach(io: File.open('public/9.png'), filename: '9.png')

user8 = User.find(8)
user8.image.attach(io: File.open('public/10.jpg'), filename: '10.jpg')

CurrentTrouble.delete_all
CurrentTrouble.create!(user_id: 1, trouble_category_id: 3)
CurrentTrouble.create!(user_id: 1, trouble_category_id: 5)
CurrentTrouble.create!(user_id: 1, trouble_category_id: 8)
CurrentTrouble.create!(user_id: 2, trouble_category_id: 1)
CurrentTrouble.create!(user_id: 2, trouble_category_id: 10)
CurrentTrouble.create!(user_id: 2, trouble_category_id: 5)
CurrentTrouble.create!(user_id: 3, trouble_category_id: 11)
CurrentTrouble.create!(user_id: 3, trouble_category_id: 6)
CurrentTrouble.create!(user_id: 3, trouble_category_id: 7)
CurrentTrouble.create!(user_id: 4, trouble_category_id: 3)
CurrentTrouble.create!(user_id: 4, trouble_category_id: 4)
CurrentTrouble.create!(user_id: 4, trouble_category_id: 6)
CurrentTrouble.create!(user_id: 5, trouble_category_id: 1)
CurrentTrouble.create!(user_id: 5, trouble_category_id: 2)
CurrentTrouble.create!(user_id: 6, trouble_category_id: 6)
CurrentTrouble.create!(user_id: 6, trouble_category_id: 7)
CurrentTrouble.create!(user_id: 6, trouble_category_id: 9)
CurrentTrouble.create!(user_id: 6, trouble_category_id: 4)
CurrentTrouble.create!(user_id: 6, trouble_category_id: 10)
CurrentTrouble.create!(user_id: 8, trouble_category_id: 10)
CurrentTrouble.create!(user_id: 8, trouble_category_id: 4)


PastTrouble.delete_all
PastTrouble.create!(user_id: 1, trouble_category_id: 1)
PastTrouble.create!(user_id: 2, trouble_category_id: 3)
PastTrouble.create!(user_id: 2, trouble_category_id: 8)
PastTrouble.create!(user_id: 2, trouble_category_id: 2)
PastTrouble.create!(user_id: 3, trouble_category_id: 8)
PastTrouble.create!(user_id: 3, trouble_category_id: 9)
PastTrouble.create!(user_id: 3, trouble_category_id: 4)
PastTrouble.create!(user_id: 4, trouble_category_id: 8)
PastTrouble.create!(user_id: 4, trouble_category_id: 9)
PastTrouble.create!(user_id: 5, trouble_category_id: 6)
PastTrouble.create!(user_id: 6, trouble_category_id: 1)
PastTrouble.create!(user_id: 6, trouble_category_id: 2)
PastTrouble.create!(user_id: 6, trouble_category_id: 3)
PastTrouble.create!(user_id: 6, trouble_category_id: 5)
PastTrouble.create!(user_id: 6, trouble_category_id: 11)
PastTrouble.create!(user_id: 6, trouble_category_id: 8)
PastTrouble.create!(user_id: 7, trouble_category_id: 4)
PastTrouble.create!(user_id: 7, trouble_category_id: 6)
PastTrouble.create!(user_id: 7, trouble_category_id: 7)
PastTrouble.create!(user_id: 7, trouble_category_id: 8)
PastTrouble.create!(user_id: 7, trouble_category_id: 9)
PastTrouble.create!(user_id: 7, trouble_category_id: 10)
PastTrouble.create!(user_id: 8, trouble_category_id: 6)
PastTrouble.create!(user_id: 8, trouble_category_id: 9)
PastTrouble.create!(user_id: 8, trouble_category_id: 11)

Board.delete_all
Board.create!(user_id: 1, title: "今日の夜ご飯何にします？", content: "毎日晩御飯のメニュー悩んでいます　みなさん書き込んでください。献立考えるの疲れました笑")
Board.create!(user_id: 2, title: "ママ友募集♪", content: "神奈川県のママ達集まれ！！！！")
Board.create!(user_id: 8, title: "子供に勉強を教える", content: "子供の成績が悪いです。家で教えているとつい感情的になってしまいます；なので教えるのをやめようと思うのですが、そうすると全く勉強しなくなります。どうすればいいんですかねぇ")

BoardSelectedCategory.delete_all
BoardSelectedCategory.create!(board_id: 1, board_category_id: 1)
BoardSelectedCategory.create!(board_id: 1, board_category_id: 2)
BoardSelectedCategory.create!(board_id: 1, board_category_id: 3)
BoardSelectedCategory.create!(board_id: 1, board_category_id: 7)
BoardSelectedCategory.create!(board_id: 2, board_category_id: 1)
BoardSelectedCategory.create!(board_id: 2, board_category_id: 4)
BoardSelectedCategory.create!(board_id: 2, board_category_id: 7)
BoardSelectedCategory.create!(board_id: 3, board_category_id: 2)
BoardSelectedCategory.create!(board_id: 3, board_category_id: 7)
BoardSelectedCategory.create!(board_id: 3, board_category_id: 8)
BoardSelectedCategory.create!(board_id: 3, board_category_id: 11)

BoardComment.delete_all
BoardComment.create!(board_id: 1, user_id: 2, content: "我が家はカレーライスです♪")
BoardComment.create!(board_id: 1, user_id: 3, content: "私は帰りが遅くなってしまったのでてんやです")
BoardComment.create!(board_id: 1, user_id: 1, content: "てんや！！！")


Room.delete_all
Room.create!(id: 1)
Room.create!(id: 2)
Room.create!(id: 3)
Room.create!(id: 4)
Room.create!(id: 5)
Room.create!(id: 6)


Entry.delete_all
Entry.create!(room_id: 1, user_id: 1)
Entry.create!(room_id: 1, user_id: 2)
Entry.create!(room_id: 2, user_id: 1)
Entry.create!(room_id: 2, user_id: 3)
Entry.create!(room_id: 3, user_id: 1)
Entry.create!(room_id: 3, user_id: 4)
Entry.create!(room_id: 4, user_id: 1)
Entry.create!(room_id: 4, user_id: 5)
Entry.create!(room_id: 5, user_id: 1)
Entry.create!(room_id: 5, user_id: 6)
Entry.create!(room_id: 6, user_id: 1)
Entry.create!(room_id: 6, user_id: 7)

RoomComment.delete_all
RoomComment.create!(room_id: 1, user_id: 2, content: "初めまして！仲良くしてください")
RoomComment.create!(room_id: 1, user_id: 1, content: "よろしくお願いします")
RoomComment.create!(room_id: 2, user_id: 3, content: "私でよければなんでも相談してください")
RoomComment.create!(room_id: 2, user_id: 1, content: "心強いです＞＜！！！")
RoomComment.create!(room_id: 3, user_id: 4, content: "仕事しながら子育てしてます。産休明け不安ですよね。")
RoomComment.create!(room_id: 3, user_id: 1, content: "そうなんです。子供といる時間が短くなると思うと悲しいです")
RoomComment.create!(room_id: 4, user_id: 5, content: "りえと言います。よかったら話しましょー")
RoomComment.create!(room_id: 4, user_id: 1, content: "是非是非")
RoomComment.create!(room_id: 5, user_id: 6, content: "初めまして。お力になれると思って連絡してみました。")
RoomComment.create!(room_id: 5, user_id: 1, content: "連絡嬉しいです。")

Notification.delete_all
Notification.create!(visitor_id: 2, visited_id: 1, room_comment_id:1, action: "room_comment", check: "false")
Notification.create!(visitor_id: 1, visited_id: 2, room_comment_id:2, action: "room_comment", check: "false")
Notification.create!(visitor_id: 3, visited_id: 1, room_comment_id:3, action: "room_comment", check: "false")
Notification.create!(visitor_id: 1, visited_id: 3, room_comment_id:4, action: "room_comment", check: "false")
Notification.create!(visitor_id: 4, visited_id: 1, room_comment_id:5, action: "room_comment", check: "false")
Notification.create!(visitor_id: 1, visited_id: 4, room_comment_id:6, action: "room_comment", check: "false")
Notification.create!(visitor_id: 5, visited_id: 1, room_comment_id:7, action: "room_comment", check: "false")
Notification.create!(visitor_id: 1, visited_id: 5, room_comment_id:8, action: "room_comment", check: "false")
Notification.create!(visitor_id: 6, visited_id: 1, room_comment_id:9, action: "room_comment", check: "false")
Notification.create!(visitor_id: 1, visited_id: 6, room_comment_id:10, action: "room_comment", check: "false")
Notification.create!(visitor_id: 2, visited_id: 1, board_comment_id:1, action: "board_comment", check: "false")
Notification.create!(visitor_id: 3, visited_id: 1, board_comment_id:2, action: "board_comment", check: "false")
Notification.create!(visitor_id: 3, visited_id: 2, board_comment_id:2, action: "board_comment", check: "false")
Notification.create!(visitor_id: 1, visited_id: 2, board_comment_id:3, action: "board_comment", check: "false")
Notification.create!(visitor_id: 1, visited_id: 3, board_comment_id:3, action: "board_comment", check: "false")

