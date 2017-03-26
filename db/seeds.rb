require 'random_data'



  #Create topics
  15.times do
    Topic.create!(
      name: RandomData.random_sentence,
      description: RandomData.random_paragraph
    )
  end
  topics = Topic.all

  #Create Posts
  50.times do
#we use create! with a bang(!). Adding a ! instructs the method to raise
#an error if there's a probelem with the data we're seeding. Using create without a bang
#could fail without warning, causing the error to surface later
  Post.create!(
  #we use methods from a class that doesn't exist yet (RandomData) that will create
  #random strings for title and body. Writing code for classes and methods that don't exist
  #yet is known as "wishful coding" and can increase productivity because it allows you to stay focused on one problem at a time
    topic: topics.sample,
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph
  )
end

posts = Post.all

25.times do
  SponsoredPost.create!(
  topic: topics.sample,
  title: RandomData.random_sentence,
  body: RandomData.random_paragraph,
  price: 1
  )
end

sponsored_post = SponsoredPost.all

#Create Comments
#we call times on an Integer. This will run a given block the specified # of times
100.times do
  Comment.create!(
  #we call sample on the array returned by Post.all in order to pick a random post to associate each comment with
  #sample returns a random element from the array every time it's called
    post: posts.sample,
    body: RandomData.random_paragraph
  )
end

puts "Seed finished"
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{SponsoredPost.count} posts created"
