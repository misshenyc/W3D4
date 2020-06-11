require_relative "questions_db"
require_relative "users"
require_relative "questions"
# require_relative "questions.db"
require_relative "question_follows"
require "byebug"

class QuestionLikes
    def self.all
        likes = QuestionsDatabase.instance.execute("SELECT * FROM question_likes")
        likes.map{|like| QuestionLikes.new(like)}
    end

    def initialize (like)
        @id = like['id']
        @likes = like['likes']
        @user_id = like['user_id']
        @question_id = like['question_id']
    end

    attr_accessor :id, :title, :body, :user_id

    def self.find_by_id(id)
        likes = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT * FROM question_likes WHERE id = ?
        SQL
        return nil unless like.length > 0
        likes.map { |like| QuestionLikes.new(like) }
        # question.new({ "id" => "1", "fname" => "Millie", "lname" => "He"  })
        # question = [{ "id" => "1", "fname" => "Millie", "lname" => "He"  }]
    end

    def self.likers_for_question_id(question_id)
        likers = QuestionsDatabase.instance.execute(<<-SQL, question_id)
            SELECT
                *
            FROM
                users
            JOIN question_likes
                ON users.id = question_likes.user_id
            WHERE
                question_likes.question_id = ?
        SQL
        return nil unless likers.length > 0
        likers.map { |liker| User.new(liker) }
    end

    def self.num_likes_for_question_id(question_id)
        like = QuestionsDatabase.instance.execute(<<-SQL, question_id)
            SELECT
                SUM(question_likes.likes) 
            FROM
                questions
            JOIN question_likes
                ON questions.id = question_likes.question_id
            WHERE
                questions.id = ?
        SQL
        like.first["SUM(question_likes.likes)"]
    end


    def self.liked_questions_for_user_id(user_id)
        liked_questions = QuestionsDatabase.instance.execute(<<-SQL, user_id)
            SELECT
                *
            FROM
                questions
            JOIN question_likes
                ON questions.id = question_likes.question_id
            WHERE
                question_likes.user_id = ?
        SQL
        return nil unless liked_questions.length > 0
        liked_questions.map{|question| Question.new(question)}
    end

    def self.most_liked_questions(n)
        questions = QuestionsDatabase.instance.execute(<<-SQL, n)
            SELECT
                *
            FROM
                questions
            JOIN question_likes
                ON questions.id = question_likes.question_id
            GROUP BY questions.id
            ORDER BY COUNT(questions.id) DESC
            LIMIT ?
        SQL
        return nil unless questions.length > 0
        questions.map { |question| Question.new(question) }
    end




end