require_relative "questions_db"
require_relative "questions"
# require_relative "questions.db"
require_relative "replies"
require_relative "question_follows"
require_relative "question_likes"
require "byebug"

class User
    def self.all
        users = QuestionsDatabase.instance.execute("SELECT * FROM users")
        users.map{|user| User.new(user)}
    end

    def initialize (user)
        @id = user['id']
        @fname = user['fname']
        @lname = user['lname']
    end

    attr_accessor :id, :fname, :lname

    def self.find_by_id(id)
        users = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT * FROM users WHERE id = ?
        SQL
        # return nil unless user.length > 0
        users.map { |user| User.new(user) }
        # User.new({ "id" => "1", "fname" => "Millie", "lname" => "He"  })
        # user = [{ "id" => "1", "fname" => "Millie", "lname" => "He"  }]
    end

    def self.find_by_name(fname, lname)
        user = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
            SELECT * FROM users WHERE fname = ? AND lname = ?
        SQL
        return nil unless user.length > 0
        User.new(user.first)
    end

    def authored_questions
        Question.find_by_user_id(self.id)
    end

    def authored_replies
        Reply.find_by_user_id(self.id)
    end

    def followed_question
        QuestionFollows.followed_questions_for_user_id(self.id)
    end


    def liked_questions
        QuestionLikes.liked_questions_for_user_id(self.id)
    end

    def average_karma
        QuestionsDatabase.instance.execute(<<-SQL, self.id)
            SELECT
                CAST((COUNT(question_likes.id) AS FLOAT) / COUNT (DISTINCT(questions.id)))
            FROM
                questions
                LEFT OUTER JOIN question_likes
                ON questions.id = question_likes.question_id
            WHERE
                questions.user_id = ?
        SQL
    end

end