# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# ActiveRecord::Base.transaction do
#   User.destroy_all
  user1 = User.create!(username: 'Torin')
  user2 = User.create!(username: 'Millie')

#   Poll.destroy_all
  poll1 = Poll.create!(user_id: 1, title: 'poll1')
  poll2 = Poll.create!(user_id: 1, title: 'poll2')
  poll3 = Poll.create!(user_id: 2, title: 'poll3')
  poll4 = Poll.create!(user_id: 2, title: 'poll4')

#   Question.destroy_all
  Question.create!(text: 'question1', poll_id: 1)
  Question.create!(text: 'question2', poll_id: 1)
  Question.create!(text: 'question3', poll_id: 3)
  Question.create!(text: 'question3', poll_id: 4)
  
#   AnswerChoice.destroy_all
  AnswerChoice.create!(text: 'answer1', question_id: 1, user_id: 1)
  AnswerChoice.create!(text: 'answer2', question_id: 2, user_id: 1)
  AnswerChoice.create!(text: 'answer3', question_id: 2, user_id: 2)
  AnswerChoice.create!(text: 'answer4', question_id: 1, user_id: 2)

#   Response.destroy_all
  Response.create!(question_id: 1, user_id: 1, answer_choices_id:1)
  Response.create!(question_id: 2, user_id: 1, answer_choices_id:1)
  Response.create!(question_id: 2, user_id: 2, answer_choices_id:2)
  Response.create!(question_id: 1, user_id: 2, answer_choices_id:2)


# end