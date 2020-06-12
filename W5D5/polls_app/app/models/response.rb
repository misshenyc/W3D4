# == Schema Information
#
# Table name: responses
#
#  id                :bigint           not null, primary key
#  question_id       :integer          not null
#  user_id           :integer          not null
#  answer_choices_id :integer          not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
class Response < ApplicationRecord

    belongs_to :respondent,
        primary_key: :id, 
        foreign_id: :user_id,
        class_name: :User


    belongs_to :answer_choice,
        primary_key: :id, 
        foreign_id: :user_id,
        class_name: :AnswerChoice
end
