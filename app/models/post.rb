class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 10}
    validates :summary, length: {maximum: 30}
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
    validate :is_clickbait?


    def is_clickbait?
        if title == nil || title.include?("Won't Believe") || title.include?("Secret") || title.include?("Top") || title.include?("Guess")
        else
            errors.add(:title, "must be clickbait")
        end
    end


end
