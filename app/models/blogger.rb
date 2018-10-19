class Blogger < ApplicationRecord

  has_many :posts
  has_many :destinations, through: :posts

  validates :name, uniqueness: true
  validates :age, length: { minimum: 0}
  validates :bio, length: { minimum: 30}

  def most_likes

      posts.sort_by do |post|
        post.likes
      end
      posts[-1]

  end

  def total_likes
    post_likes = posts.map do |post|
      post.likes
    end
    post_likes.sum
  end

  def favorite_destination
    destination_posts = {}
    destinations.each do |destination|
      if destination_posts[destination.name]
        destination_posts[destination.name][:count] += 1
      else
        destination_posts[destination.name] = { count: 1, id: destination.id }
      end
    end

    destination_posts.max_by(5) do |destination, values|
      values[:count]
    end

    # find the instances for each of these
  end



end
