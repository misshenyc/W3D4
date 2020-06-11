class User < ApplicationRecord
    validates :email, uniqueness: true, presence: true
    

    has_many :submitted_urls,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :Shortened_Url
end