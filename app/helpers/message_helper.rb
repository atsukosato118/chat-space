module MessageHelper
  def create_time(created_at)
    created_at.in_time_zone('Tokyo').strftime("%Y/%m/%d %H:%M:%S")
  end
end

# モジュールではクラスと同様に、定数やメソッドをまとめるが以下の点が異なる
# *インスタンスを持たない
# *継承できない
# クラスはモノと処理だがモジュールは処理だけ

# created_at.in_time_zone('Tokyo').strftime("%Y/%m/%d %H:%M:%S")
