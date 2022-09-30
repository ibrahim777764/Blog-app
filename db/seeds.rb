# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

p "Seeding..."
users = User.create([{name: 'Tom', photo: 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fpixabay.com%2Fimages%2Fsearch%2Ftom%2520and%2520jerry%2F&psig=AOvVaw2P7h_6x6ugSSHYItnyBXJb&ust=1664622282222000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCKimp7CvvPoCFQAAAAAdAAAAABAE', bio: 'Teacher from Mexico.', posts_counter: 0},
{name: 'Lilly', photo: 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fpixabay.com%2Fimages%2Fsearch%2Ftom%2520and%2520jerry%2F&psig=AOvVaw2P7h_6x6ugSSHYItnyBXJb&ust=1664622282222000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCKimp7CvvPoCFQAAAAAdAAAAABAE', bio: 'Teacher from Poland.', posts_counter: 0}])


posts = Post.create([{user_id: users.first, title: 'Hello', text: 'This is my first post', comments_counter: 0,
    likes_counter: 0},
    {user_id: users.first, title: 'Hello', text: 'This is my second post', comments_counter: 0, likes_counter: 0},
    {user_id: users.first, title: 'Hello', text: 'This is my long post. Hi Tom!
    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin nec arcu odio. Nulla feugiat, ipsum quis facilisis
    vulputate, elit metus vehicula risus, sit amet suscipit mauris sem at est. Aliquam erat volutpat. Vivamus id ligula
    pretium, iaculis risus vitae, eleifend nibh. Donec bibendum pharetra eleifend. Nunc enim ligula, sodales venenatis
    efficitur sit amet, hendrerit id metus. Nulla dapibus, neque mattis varius dapibus, mi purus laoreet odio, quis
    venenatis elit nunc a ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae;
    Nullam lacinia velit arcu, non tincidunt orci sagittis sed. Pellentesque pretium lobortis leo.
    Ut lacinia ipsum quis lacus sagittis bibendum. Pellentesque habitant morbi tristique senectus et netus et malesuada
    fames ac turpis egestas. Morbi vel congue justo. Sed cursus fringilla metus, sollicitudin sagittis mi sagittis vel.
    Phasellus magna tortor, dignissim non quam id, gravida ultrices augue. Sed pellentesque accumsan erat, non blandit diam
    fringilla non. Sed eget risus posuere, ornare orci eu, feugiat sem. Aenean dignissim cursus elementum. Nulla aliquet
    faucibus lacus, a congue est fermentum ut. Etiam non elementum risus, in dapibus augue. Nam eu nulla dictum, cursus
    dolor at, eleifend sem. Cras sapien augue, sollicitudin in enim vitae, dictum pharetra elit. Lorem ipsum dolor sit amet,
    consectetur adipiscing elit. Integer at justo luctus, pulvinar mauris vel, viverra urna. Vivamus risus libero, egestas
    vehicula lectus at, elementum cursus turpis. Donec quam nibh, ultricies eu condimentum at, volutpat ac orci.',
    comments_counter: 0, likes_counter: 0}])

comments = Comment.create([{post_id: posts, user_id: users[1], text: 'Hi Tom!'},
    {post_id: posts.first, user_id: users[1],text: 'Hi Tom! Again'},
    {post_id: posts.first, user_id: users[1], text: 'Hi Tom! Thrice'},
    {post_id: posts[1], user_id: users[1], text: 'Hi Tom! Four times'}])
p "Successfully created #{User.count} users"
p "Successfully created #{Post.count} posts"
p "Successfully created #{Comment.count} comments"
p "Seeding finished"

