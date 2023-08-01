#creating users
(0..10).each do 
    User.create(email: Faker::Internet.email, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,
    phone: "1", password: "password", username: Faker::Internet.username)
end


#list of tags
Tag.create(name: "tufting")
Tag.create(name: "needle work")
Tag.create(name: "Resin")
Tag.create(name: "DIY")
Tag.create(name: "Paper Craft")


#placeholder image URLs
placeholder_images = [
    "https://www.cbc.ca/kids/images/tufting_header.jpg",
    "https://studio-koekoek.com/wp-content/uploads/2018/12/punch-needle-sample-pattern.jpg",
    "https://artincontext.org/wp-content/uploads/2022/02/Best-Epoxy-Resin-848x530.jpg",
    "https://i.etsystatic.com/21608908/r/il/867cb8/3113676344/il_fullxfull.3113676344_bqay.jpg",
    "https://media.architecturaldigest.com/photos/62fbfff2d6ab542a7136b91f/16:9/w_2560%2Cc_limit/Lars-paper-chain-wall-hanging-10.jpg",
    "https://abakcus.com/wp-content/uploads/2021/05/How-to-Make-a-Geometric-Paper-Wall-Art-DIY-Project-Abakcus.jpg",
    "https://i.pinimg.com/originals/98/9b/a4/989ba487a30a50c37333a26ee1a9b8b6.jpg",
    "https://images.squarespace-cdn.com/content/v1/5b6e3beb85ede1a17e4a6830/1621262859195-L2ET1QU4QL3DKGC05OSW/butterfly.jpg",
    "https://i0.wp.com/blog.treasurie.com/wp-content/uploads/2022/02/punch-needle-0.jpg",
    "https://i.etsystatic.com/33137877/r/il/e27bb2/3659979334/il_794xN.3659979334_5oop.jpg"
]

# Seed data for posts
(0..100).each do |i|
    post = Post.new(
      user_id: rand(1..10), # Random user_id, assuming there are 10 users
      content: Faker::Lorem.paragraphs(number: rand(1..3)).join("\n\n"), # Random content with 1 to 3 paragraphs
      image_path: placeholder_images.sample # Random image URL from the placeholder_images array
    )
  
    # Attach random tags to the post (0 to 6 tags)
    post.tags = Tag.all.sample(rand(0..3))
    post.save
end
  
#give all users a username
User.all.each do |user|
    username = "#{user.first_name.downcase}.#{user.last_name.downcase}"
    username = "#{username}.#{rand(100)}" while User.exists?(username: username)
    user.update(username: username)
  end