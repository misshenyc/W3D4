require_relative "questions_db"
require_relative "users"
# require_relative "questions.db"
require_relative "replies"
require_relative "question_follows"
require_relative "question_likes"
require "byebug"

class Question
    def self.all
        questions = QuestionsDatabase.instance.execute("SELECT * FROM questions")
        questions.map{|question| Question.new(question)}
    end

    def initialize (question)
        @id = question['id']
        @title = question['title']
        @body = question['body']
        @user_id = question['user_id']
    end

    attr_accessor :id, :title, :body, :user_id

    def self.find_by_id(id)
        question = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT * FROM questions WHERE id = ?
        SQL
        return nil unless question.length > 0
        Question.new(question.first)
        # question.new({ "id" => "1", "fname" => "Millie", "lname" => "He"  })
        # question = [{ "id" => "1", "fname" => "Millie", "lname" => "He"  }]
    end

    def self.find_by_user_id(user_id)
        questions = QuestionsDatabase.instance.execute(<<-SQL, user_id)
            SELECT * FROM questions WHERE user_id = ?
        SQL
        # return nil unless question.length > 0
        questions.map { |question| Question.new(question) }
    end

    def author
        User.find_by_id(self.user_id)
    end

    def replies
        Reply.find_by_question_id(self.id)
    end

    def followers
        QuestionFollows.followers_for_question_id(question_id)
    end

    def self.most_followed(n)
        QuestionFollows.most_followed_questions(n)
    end

    def likers
        QuestionLikes.likers_for_question_id(self.id)
    end

    def num_likes
        QuestionLikes.num_likes_for_question_id(self.id)
    end

    def self.most_liked(n)
        QuestionLikes.most_liked_questions(n)
    end
end