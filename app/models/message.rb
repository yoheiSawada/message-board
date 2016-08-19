class Message < ActiveRecord::Base

validates :name ,length: { maximum: 20 } ,presence: true
#検証している。　名前の長さが最大20で　存在していれば　true
validates :body ,length: { minimum: 2, maximum: 30 } ,presence: true
#検証している。　内容（body）の長さが２から３０で　存在していれば　true

validates :age ,numericality: { only_integer: true , greater_than_or_equal_to: 0 } 

end

#バリデーションとはモデルオブジェクトをデータベースに保存する前に、そのデータが正しいかどうかを検証する仕組みです。
#例えばメッセージの内容を空の状態で送信された場合、無意味な空のデータが作成されてしまうため表示の際などに不具合が起きてしまいます。
#バリデーションは、このような不具合を防ぎ、データの整合性を保ちます