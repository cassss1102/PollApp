# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Question.destroy_all
AnswerChoice.destroy_all
Poll.destroy_all
Response.destroy_all

ActiveRecord::Base.transaction do
  user1 = User.create!(name: "Srishti")
  user2 = User.create!(name: "Cassi")

  poll1 = Poll.create!(title: "Poll 1", author_id: user1.id)
  poll2 = Poll.create!(title: "Poll 2", author_id: user2.id)

  q1 = Question.create!(text: "I am question 1", poll_id: poll1.id)
  q2 = Question.create!(text: "I am question 2", poll_id: poll2.id)

  ans_choice1 = AnswerChoice.create!(question_id: q1.id, text: "I am answer 1")
  ans_choice2 = AnswerChoice.create!(question_id: q2.id, text: "I am answer 2")


  Response.create!(answer_choice_id: ans_choice1.id, respondent_id: user1.id)
  Response.create!(answer_choice_id: ans_choice2.id, respondent_id: user2.id)
end
