# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Admin.create(email: 'admin@admin.ru', password: 'admin@admin.ru', password_confirmation: 'admin@admin.ru')

4.times do |user_index|
  User.create(
    name: "user#{user_index}",
    email: "user#{user_index}@user.ru",
    password: "user#{user_index}@user.ru",
    password_confirmation: "user#{user_index}@user.ru"
  )
end

users = User.all

Post.create(title: 'Some topic', content: 'some content', user: users[0])
Post.create(title: 'Some topic 2', content: 'some content 2', user: users[1])
Post.create(title: 'Some topic 3', content: 'some content 3', user: users[1])

Post.all.each do |post|
  rand(1..4).times do |i|
    post.likes.create(user: users[i], post: post)
    post.comments.create(user: users[i], post: post, content: "content message #{i}")
  end
end
