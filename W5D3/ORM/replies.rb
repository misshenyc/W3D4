require_relative "questions_db"
require_relative "users"
require_relative "questions"
# require_relative "questions.db"
require_relative "question_follows"
require_relative "question_likes"
require "byebug"

class Reply
    def self.all
        replies = QuestionsDatabase.instance.execute("SELECT * FROM replies")
        replies.map{ |reply| Reply.new(reply) }
    end

    def initialize (replies)
        @id = replies['id']
        @question_id = replies['question_id']
        @parent_id = replies['parent_id']
        @user_id = replies['user_id']
        @content = replies['content']
    end

    attr_accessor :id, :question_id, :parent_id, :user_id, :content

    def self.find_by_id(id)
        replies = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT * FROM replies WHERE id = ?
        SQL
        return nil unless replies.length > 0
        replies.map { |reply| Reply.new(reply) }
        # question.new({ "id" => "1", "fname" => "Millie", "lname" => "He"  })
        # question = [{ "id" => "1", "fname" => "Millie", "lname" => "He"  }]
    end

    def self.find_by_user_id(user_id)
        reply = QuestionsDatabase.instance.execute(<<-SQL, user_id)
            SELECT * FROM replies WHERE user_id = ?
        SQL
        return nil unless reply.length > 0
        Reply.new(reply.first)
    end

    def self.find_by_question_id(question_id)
        reply = QuestionsDatabase.instance.execute(<<-SQL, question_id)
            SELECT * FROM replies WHERE question_id = ?
        SQL
        return nil unless reply.length > 0
        Reply.new(reply.first)
    end

    def self.find_by_parent_id(parent_id)
        replies = QuestionsDatabase.instance.execute(<<-SQL, parent_id)
            SELECT * FROM replies WHERE parent_id = ?
        SQL
        return nil unless replies.length > 0
        replies.map { |reply| Reply.new(reply) }
        # question.new({ "id" => "1", "fname" => "Millie", "lname" => "He"  })
        # question = [{ "id" => "1", "fname" => "Millie", "lname" => "He"  }]
    end

    def author
        User.find_by_id(self.user_id)
    end

    def question
        Question.find_by_id(self.question_id)
    end

    def parent_reply
        Reply.find_by_id(parent_id)
    end

    def child_replies
        Reply.find_by_parent_id(id)
    end

end

# Rosemary id: a, parent_id = nil 
# Millie id: b, parent_id = a 
# Nara id: c, parent_id = a 

