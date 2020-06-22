# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Cat < ApplicationRecord
    include ActionView::Helpers::DateHelper

    validates :birth_date, :color, :name, :sex, :description, presence: true

    def age
        time_ago_in_words(birth_date)
    end

    has_many :requests,
        foreign_key: :cat_id,
        class_name: :Cat_rental_request,
        dependent: :destroy

end
