class Sub < ApplicationRecord

    validates :title, :description, presence:true

    belongs_to :moderator
    has_many :posts
end
