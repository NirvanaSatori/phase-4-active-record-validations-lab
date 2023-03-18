class Post < ApplicationRecord

    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: { in: %w(Fiction Non-Fiction),
        message: "is not included in the list"}

    validate :has_clickbait

    def has_clickbait
        valids = [/Won't Believe/i, /Secret/i, /Top \d/i, /Guess/i]
        if valids.none?{|par| par.match title}
			errors.add(:title, "does not contain clickbait")
		end
    end
end
