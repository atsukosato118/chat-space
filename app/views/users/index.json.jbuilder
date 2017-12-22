json.array! @users do |user|
  json.name user.name
  json.id   user.id
end


# json.array!
# JSON形式のデータを配列で返したい
# インクリメンタルサーチでヒットした名前のためuserの名前
# userを追加して保存するにはuserのidが必要
