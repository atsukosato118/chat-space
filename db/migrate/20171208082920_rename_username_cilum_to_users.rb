# カラム名を変更したためにできたマイグレーションファイル

class RenameUsernameCilumToUsers < ActiveRecord::Migration[5.0]
  def change
  	rename_column :users, :username, :name
  end
end

# カラム名の変更方法
# モデル名：tests
# 変更したいカラム名：Date
# 変更後のカラム名：post_date

# カラム名を変更するためのmigrationファイルを作成します。

# $ rails g migration rename_Date_column_to_tests

# db/migrate/20150629074110_rename_date_column_to_tests.rb っていうファイルが作成されます。
# class RenameDateColumnToTests < ActiveRecord::Migration
#   def change
#     rename_column :tests, :Date, :post_date
#   end
# end

# #rename_column テーブル名, 変更するカラム名, 変更後のカラム名 rename_column :tests, :Date, :post_date
# 次に
# $rake db:migrate
# でDBに反映すれば完了