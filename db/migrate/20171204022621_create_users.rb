class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false, unigue: true
      t.timestamps
    end
  end
end


# t.に続くのが「型」で、:に続くのがカラム名

## usersテーブル

# |Column|Type|Options|
# |------|----|-------|
# |name|string|null: false|
# |email|string|null: false, unigue: true|

# null: false
# NOT NULL制約はテーブルの属性値にNULL（空の値）が入ることを許さない制約

# unigue: true
# 一意性制約を設定したカラムには同じ値を設定できなくなります