class Shortened_Url < ApplicationRecord
    validates :short_url, uniqueness: true, presence: true

    def self.random_code
            random = SecureRandom::urlsafe_base64
            until !Shortened_Url.exists?(:short_url => random)
                random = SecureRandom::urlsafe_base64
            end
            random
    end

    def self.generate_shorty(user_id, long_url)
        Shortened_Url.create!(:user_id => user_id, :long_url => long_url, :short_url => Shortened_Url.random_code)
    end

    #submitter (should return only 1 user)
    belongs_to :submitter,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :User

end