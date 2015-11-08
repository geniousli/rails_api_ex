# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do |item|
  user = User.create(email: "safsfsdf#{item}@qq.com", name: "lishaohua0", password: "11111111")
  blog = Blog.create(title: "first blog", content: "first blog test", user: user)
end
