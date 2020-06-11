class Shortened_Url < ApplicationRecord
    validates :short_url, uniqueness: true, presence: true



end