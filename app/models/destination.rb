class Destination < ApplicationRecord

    has_many :posts
    has_many :bloggers, through: :posts

    def most_likes
        posts.sort_by do |post|
          post.likes
        end
        posts[-1]
    end

    def average_age
      age_bloggers = bloggers.map do |blogger|
        blogger.age
      end
        age_bloggers.sum / age_bloggers.count
    end

    def most_recent
      sort_posts = posts.sort_by do |post|
        post.created_at
      end

      sort_posts.max_by(5) do |post|
        post.created_at
      end
    end
end
