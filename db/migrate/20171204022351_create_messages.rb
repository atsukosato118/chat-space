class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.text :body, null: false
      t.string :image, null: false
      t.integer :group_id, foreign_key: true
      t.integer :user_id, foreign_key: true
      t.timestamps
    end
  end
end

# t.に続くのが「型」で、:に続くのがカラム名

## messagesテーブル

# |Column|Type|Options|
# |------|----|-------|
# |body|text|null: false|
# |image|string|null: false|
# |group_id|integer|foreign_key: true|
# |user_id|integer|foreign_key: true|

# null: false
# NOT NULL制約はテーブルの属性値にNULL（空の値）が入ることを許さない制約

# foreign_key: true
#外部キーに対応するレコードが必ず存在することを保証する制約