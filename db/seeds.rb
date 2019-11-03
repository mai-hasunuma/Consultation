# frozen_string_literal: true
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
tr_category1 = TroubleCategory.create(name: '仕事と家庭の両立')
tr_category2 = TroubleCategory.create(name: '家事全般')
tr_category3 = TroubleCategory.create(name: '育児')
tr_category4 = TroubleCategory.create(name: '嫁姑問題')
tr_category5 = TroubleCategory.create(name: '仕事と育児の両立')
tr_category6 = TroubleCategory.create(name: '貯蓄')
tr_category7 = TroubleCategory.create(name: '介護')
tr_category8 = TroubleCategory.create(name: 'ワンオペ育児')
tr_category9 = TroubleCategory.create(name: '同居')
tr_category10 = TroubleCategory.create(name: '受験')
tr_category11 = TroubleCategory.create(name: 'いじめ')

# # 掲示板カテゴリ
BoardCategory.delete_all
bd_category1 = BoardCategory.create(name: '雑談')
bd_category2 = BoardCategory.create(name: '相談')
bd_category3 = BoardCategory.create(name: '家事')
bd_category4 = BoardCategory.create(name: '育児')
bd_category5 = BoardCategory.create(name: '妊娠')
bd_category6 = BoardCategory.create(name: '仕事')
bd_category7 = BoardCategory.create(name: '日常')
bd_category8 = BoardCategory.create(name: '受験')
bd_category9 = BoardCategory.create(name: '介護')
bd_category10 = BoardCategory.create(name: '節約')
bd_category11 = BoardCategory.create(name: '小学校')

AdminUser.delete_all
AdminUser.create(email: ENV['EMAIL_admin'], password: ENV['PASSWORD_admin'], password_confirmation: ENV['PASSWORD_admin'])

# ユーザ
User.with_deleted.delete_all
user1 = User.create(name: 'テスト', email: ENV['EMAIL1'], password: ENV['PASSWORD_test'], password_confirmation: ENV['PASSWORD_test'], housewife_year: 4, introduction: '結婚３年目で１才の子供を保育園に預けながら時短で働いています。最近産休から仕事に復帰しました。子供の夜泣きで寝不足の日々ですが、子供は最高に可愛いです。育児と仕事の両立で忙しいですが、日々充実しています。子育て中のワーママさん、先輩ママさん、仲良くしてください。よろしくお願いいたします。')
user1.image.attach(io: File.open('public/3.png'), filename: '3.png')

user2 = User.create(name: 'まさん', email: ENV['EMAIL2'], password: ENV['PASSWORD_user'], password_confirmation: ENV['PASSWORD_user'], housewife_year: 10, introduction: '来年息子が小学校に上がります。やっと子育ても少し落ち着いてきましたが、働いているので小１の壁が不安です。先輩ママさん仲良くしてくださいっ')
user2.image.attach(io: File.open('public/4.jpg'), filename: '4.jpg')

user3 = User.create(name: 'トントン', email: ENV['EMAIL3'], password: ENV['PASSWORD_user'], password_confirmation: ENV['PASSWORD_user'], housewife_year: 17, introduction: '子供が学校で突然いじめられてしまいました。学校に相談しているのですが、なかなか治らず学校に行くことができません。旦那が単身赴任なので心細いです。')
user3.image.attach(io: File.open('public/5.png'), filename: '5.png')

user4 = User.create(name: '晶子', email: ENV['EMAIL4'], password: ENV['PASSWORD_user'], password_confirmation: ENV['PASSWORD_user'], housewife_year: 7, introduction: '今年二人目を出産しました。一人目の子と遊ぶ時間が取れないのが悩みです；')
user4.image.attach(io: File.open('public/6.png'), filename: '6.png')

user5 = User.create(name: 'りえ', email: ENV['EMAIL5'], password: ENV['PASSWORD_user'], password_confirmation: ENV['PASSWORD_user'], housewife_year: 3, introduction: '現在妊活中ですが仕事も忙しく思うように行きません。年齢的にも内心焦っています。家事が苦手で仕事も忙しいので精神的に辛いです。同じ境遇だった先輩ママさんからアドバイスいただきたいです')
user5.image.attach(io: File.open('public/7.jpg'), filename: '7.jpg')

user6 = User.create(name: '咲', email: ENV['EMAIL6'], password: ENV['PASSWORD_user'], password_confirmation: ENV['PASSWORD_user'], housewife_year: 20, introduction: '子供が今年大学受験です。気が早いですが、これが終わったら子育ても終わりだなと思いホッとしている反面悲しいです。子育ても落ち着いてきたので医療事務の資格を取って働こうと思っています。よろしくお願いします')
user6.image.attach(io: File.open('public/8.jpg'), filename: '8.jpg')

user7 = User.create(name: '千春', email: ENV['EMAIL7'], password: ENV['PASSWORD_user'], password_confirmation: ENV['PASSWORD_user'], housewife_year: 25, introduction: '今年子供の就職活動が終了し、３人の娘の子育てが終わりました。皆さんの相談に乗ります')
user7.image.attach(io: File.open('public/9.png'), filename: '9.png')

user8 = User.create(name: 'れいか', email: ENV['EMAIL8'], password: ENV['PASSWORD_user'], password_confirmation: ENV['PASSWORD_user'], housewife_year: 13, introduction: '娘が小学校６年生で受験生です。成績が伸び悩んでいて、厳しい状況です。親としてできることを探しにこちらに登録しました。')
user8.image.attach(io: File.open('public/10.jpg'), filename: '10.jpg')

CurrentTrouble.delete_all
CurrentTrouble.create!(user_id: user1.id, trouble_category_id: tr_category3.id)
CurrentTrouble.create!(user_id: user1.id, trouble_category_id: tr_category5.id)
CurrentTrouble.create!(user_id: user1.id, trouble_category_id: tr_category8.id)
CurrentTrouble.create!(user_id: user2.id, trouble_category_id: tr_category1.id)
CurrentTrouble.create!(user_id: user2.id, trouble_category_id: tr_category10.id)
CurrentTrouble.create!(user_id: user2.id, trouble_category_id: tr_category5.id)
CurrentTrouble.create!(user_id: user2.id, trouble_category_id: tr_category11.id)
CurrentTrouble.create!(user_id: user3.id, trouble_category_id: tr_category6.id)
CurrentTrouble.create!(user_id: user4.id, trouble_category_id: tr_category7.id)
CurrentTrouble.create!(user_id: user4.id, trouble_category_id: tr_category3.id)
CurrentTrouble.create!(user_id: user4.id, trouble_category_id: tr_category4.id)
CurrentTrouble.create!(user_id: user4.id, trouble_category_id: tr_category6.id)
CurrentTrouble.create!(user_id: user5.id, trouble_category_id: tr_category1.id)
CurrentTrouble.create!(user_id: user5.id, trouble_category_id: tr_category2.id)
CurrentTrouble.create!(user_id: user6.id, trouble_category_id: tr_category6.id)
CurrentTrouble.create!(user_id: user6.id, trouble_category_id: tr_category7.id)
CurrentTrouble.create!(user_id: user6.id, trouble_category_id: tr_category9.id)
CurrentTrouble.create!(user_id: user6.id, trouble_category_id: tr_category4.id)
CurrentTrouble.create!(user_id: user6.id, trouble_category_id: tr_category10.id)
CurrentTrouble.create!(user_id: user8.id, trouble_category_id: tr_category10.id)
CurrentTrouble.create!(user_id: user8.id, trouble_category_id: tr_category4.id)

PastTrouble.delete_all
PastTrouble.create!(user_id: user1.id, trouble_category_id: tr_category1.id)
PastTrouble.create!(user_id: user2.id, trouble_category_id: tr_category3.id)
PastTrouble.create!(user_id: user2.id, trouble_category_id: tr_category8.id)
PastTrouble.create!(user_id: user2.id, trouble_category_id: tr_category2.id)
PastTrouble.create!(user_id: user3.id, trouble_category_id: tr_category8.id)
PastTrouble.create!(user_id: user3.id, trouble_category_id: tr_category9.id)
PastTrouble.create!(user_id: user3.id, trouble_category_id: tr_category4.id)
PastTrouble.create!(user_id: user4.id, trouble_category_id: tr_category8.id)
PastTrouble.create!(user_id: user4.id, trouble_category_id: tr_category9.id)
PastTrouble.create!(user_id: user5.id, trouble_category_id: tr_category6.id)
PastTrouble.create!(user_id: user6.id, trouble_category_id: tr_category1.id)
PastTrouble.create!(user_id: user6.id, trouble_category_id: tr_category2.id)
PastTrouble.create!(user_id: user6.id, trouble_category_id: tr_category3.id)
PastTrouble.create!(user_id: user6.id, trouble_category_id: tr_category5.id)
PastTrouble.create!(user_id: user6.id, trouble_category_id: tr_category11.id)
PastTrouble.create!(user_id: user6.id, trouble_category_id: tr_category8.id)
PastTrouble.create!(user_id: user7.id, trouble_category_id: tr_category4.id)
PastTrouble.create!(user_id: user7.id, trouble_category_id: tr_category6.id)
PastTrouble.create!(user_id: user7.id, trouble_category_id: tr_category7.id)
PastTrouble.create!(user_id: user7.id, trouble_category_id: tr_category8.id)
PastTrouble.create!(user_id: user7.id, trouble_category_id: tr_category9.id)
PastTrouble.create!(user_id: user7.id, trouble_category_id: tr_category10.id)
PastTrouble.create!(user_id: user8.id, trouble_category_id: tr_category6.id)
PastTrouble.create!(user_id: user8.id, trouble_category_id: tr_category9.id)
PastTrouble.create!(user_id: user8.id, trouble_category_id: tr_category11.id)

Board.delete_all
board1 = Board.create!(user_id: user1.id, title: '今日の夜ご飯何にします？', content: '毎日晩御飯のメニュー悩んでいます　みなさん書き込んでください。献立考えるの疲れました笑')
board2 = Board.create!(user_id: user2.id, title: 'ママ友募集♪', content: '神奈川県のママ達集まれ！！！！')
board3 = Board.create!(user_id: user8.id, title: '子供に勉強を教える', content: '子供の成績が悪いです。家で教えているとつい感情的になってしまいます；なので教えるのをやめようと思うのですが、そうすると全く勉強しなくなります。どうすればいいんですかねぇ')

BoardSelectedCategory.delete_all
BoardSelectedCategory.create!(board_id: board1.id, board_category_id: bd_category1.id)
BoardSelectedCategory.create!(board_id: board1.id, board_category_id: bd_category2.id)
BoardSelectedCategory.create!(board_id: board1.id, board_category_id: bd_category3.id)
BoardSelectedCategory.create!(board_id: board1.id, board_category_id: bd_category7.id)
BoardSelectedCategory.create!(board_id: board2.id, board_category_id: bd_category1.id)
BoardSelectedCategory.create!(board_id: board2.id, board_category_id: bd_category4.id)
BoardSelectedCategory.create!(board_id: board2.id, board_category_id: bd_category7.id)
BoardSelectedCategory.create!(board_id: board3.id, board_category_id: bd_category2.id)
BoardSelectedCategory.create!(board_id: board3.id, board_category_id: bd_category7.id)
BoardSelectedCategory.create!(board_id: board3.id, board_category_id: bd_category8.id)
BoardSelectedCategory.create!(board_id: board3.id, board_category_id: bd_category11.id)

BoardComment.delete_all
BoardComment.create!(board_id: board1.id, user_id: user2.id, content: '我が家はカレーライスです♪')
BoardComment.create!(board_id: board1.id, user_id: user3.id, content: '私は帰りが遅くなってしまったのでてんやです')
BoardComment.create!(board_id: board1.id, user_id: user1.id, content: 'てんや！！！')

Room.delete_all
room1 = Room.create!
room2 = Room.create!
room3 = Room.create!
room4 = Room.create!
room5 = Room.create!
room6 = Room.create!

Entry.delete_all
Entry.create!(room_id: room1.id, user_id: user1.id)
Entry.create!(room_id: room1.id, user_id: user2.id)
Entry.create!(room_id: room2.id, user_id: user1.id)
Entry.create!(room_id: room2.id, user_id: user3.id)
Entry.create!(room_id: room3.id, user_id: user1.id)
Entry.create!(room_id: room3.id, user_id: user4.id)
Entry.create!(room_id: room4.id, user_id: user1.id)
Entry.create!(room_id: room4.id, user_id: user5.id)
Entry.create!(room_id: room5.id, user_id: user1.id)
Entry.create!(room_id: room5.id, user_id: user6.id)
Entry.create!(room_id: room6.id, user_id: user1.id)
Entry.create!(room_id: room6.id, user_id: user7.id)

RoomComment.delete_all
rc1 = RoomComment.create!(room_id: room1.id, user_id: user2.id, content: '初めまして！仲良くしてください')
rc2 = RoomComment.create!(room_id: room1.id, user_id: user1.id, content: 'よろしくお願いします')
rc3 = RoomComment.create!(room_id: room2.id, user_id: user3.id, content: '私でよければなんでも相談してください')
rc4 = RoomComment.create!(room_id: room2.id, user_id: user1.id, content: '心強いです＞＜！！！')
rc5 = RoomComment.create!(room_id: room3.id, user_id: user4.id, content: '仕事しながら子育てしてます。産休明け不安ですよね。')
rc6 = RoomComment.create!(room_id: room3.id, user_id: user1.id, content: 'そうなんです。子供といる時間が短くなると思うと悲しいです')
rc7 = RoomComment.create!(room_id: room4.id, user_id: user5.id, content: 'りえと言います。よかったら話しましょー')
rc8 = RoomComment.create!(room_id: room4.id, user_id: user1.id, content: '是非是非')
rc9 = RoomComment.create!(room_id: room5.id, user_id: user6.id, content: '初めまして。お力になれると思って連絡してみました。')
rc10 = RoomComment.create!(room_id: room5.id, user_id: user1.id, content: '連絡嬉しいです。')

Notification.delete_all
Notification.create!(visitor_id: user2.id, visited_id: user1.id, room_comment_id: rc1.id, action: 'room_comment', check: 'false')
Notification.create!(visitor_id: user1.id, visited_id: user2.id, room_comment_id: rc2.id, action: 'room_comment', check: 'false')
Notification.create!(visitor_id: user3.id, visited_id: user1.id, room_comment_id: rc3.id, action: 'room_comment', check: 'false')
Notification.create!(visitor_id: user1.id, visited_id: user3.id, room_comment_id: rc4.id, action: 'room_comment', check: 'false')
Notification.create!(visitor_id: user4.id, visited_id: user1.id, room_comment_id: rc5.id, action: 'room_comment', check: 'false')
Notification.create!(visitor_id: user1.id, visited_id: user4.id, room_comment_id: rc6.id, action: 'room_comment', check: 'false')
Notification.create!(visitor_id: user5.id, visited_id: user1.id, room_comment_id: rc7.id, action: 'room_comment', check: 'false')
Notification.create!(visitor_id: user1.id, visited_id: user5.id, room_comment_id: rc8.id, action: 'room_comment', check: 'false')
Notification.create!(visitor_id: user6.id, visited_id: user1.id, room_comment_id: rc9.id, action: 'room_comment', check: 'false')
Notification.create!(visitor_id: user1.id, visited_id: user6.id, room_comment_id: rc10.id, action: 'room_comment', check: 'false')
Notification.create!(visitor_id: user2.id, visited_id: user1.id, board_comment_id: rc1.id, action: 'board_comment', check: 'false')
Notification.create!(visitor_id: user3.id, visited_id: user1.id, board_comment_id: rc2.id, action: 'board_comment', check: 'false')
Notification.create!(visitor_id: user3.id, visited_id: user2.id, board_comment_id: rc2.id, action: 'board_comment', check: 'false')
Notification.create!(visitor_id: user1.id, visited_id: user2.id, board_comment_id: rc3.id, action: 'board_comment', check: 'false')
Notification.create!(visitor_id: user1.id, visited_id: user3.id, board_comment_id: rc3.id, action: 'board_comment', check: 'false')
