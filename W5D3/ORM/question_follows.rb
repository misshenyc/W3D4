require_relative "questions_db"
require_relative "users"
require_relative "questions"
# require_relative "questions.db"
require_relative "question_likes"
require "byebug"

class QuestionFollows
    def self.all
        follows = QuestionsDatabase.instance.execute("SELECT * FROM question_follows")
        follows.map{|follow| QuestionFollows.new(follow)}
    end

    def initialize (follow)
        @id = follow['id']
        @user_id = follow['user_id']
        @question_id = follow['question_id']
    end

    attr_accessor :id, :title, :body, :user_id

    def self.find_by_id(id)
        follows = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT * FROM question_follows WHERE id = ?
        SQL
        return nil unless follow.length > 0
        follows.map { |follow| QuestionFollows.new(follow) }
        # question.new({ "id" => "1", "fname" => "Millie", "lname" => "He"  })
        # question = [{ "id" => "1", "fname" => "Millie", "lname" => "He"  }]
    end

    def self.followers_for_question_id(question_id)
        followers = QuestionsDatabase.instance.execute(<<-SQL, question_id)
            SELECT * FROM users JOIN question_follows ON users.id = question_follows.user_id WHERE question_id = ?
        SQL
        return nil unless followers.length > 0
        followers.map { |follower| User.new(follower) }
    end

    def self.followed_questions_for_user_id(user_id)
        questions = QuestionsDatabase.instance.execute(<<-SQL, user_id)
            SELECT * FROM questions JOIN question_follows ON questions.id = question_follows.question_id WHERE question_follows.user_id = ?
        SQL
        return nil unless questions.length > 0
        questions.map { |question| Question.new(question) }
    end

    def self.most_followed_questions(n)
        questions = QuestionsDatabase.instance.execute(<<-SQL, n)
            SELECT
                *
            FROM
                questions
            JOIN question_follows
                ON questions.id = question_follows.question_id
            GROUP BY questions.id
            ORDER BY COUNT(question.id) DESC
            LIMIT ?
        SQL
        return nil unless questions.length > 0
        questions.map { |question| Question.new(question) }
    end

end