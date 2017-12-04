class CreateGroupUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :group_users do |t|
    	t.references :user, index: true, foreign_key: true
    	t.references :group, index: true, foreign_key: true
      t.timestamps
    end
   end
end

# t.に続くのが「型」で、:に続くのがカラム名

## group_usersテーブル
# |Column|Type|Options|
# |------|----|-------|
# |references|user|index: true, foreign_key: true|
# |references|group|index: true, foreign_key: true|

# foreign_key: true
#外部キーに対応するレコードが必ず存在することを保証する制約

# index: true
# インデックスをカラムに設定するとそのカラムで検索をした場合に検索速度が向上します