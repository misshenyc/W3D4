class User < ApplicationRecord
    validates :username,:session_token, presence:true, uniqueness:true
    validates :password_digest, presence:true
    validates :password, length: {minimum: 6, allow_nil: true}

    after_initialize :ensure_session_token

    attr_reader :password

    def reset_session_token!
        self.session_token = SecureRandom::urlsafe_base64
        self.save!
        self.session_token
    end

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end

    def is_password?(password)
        pw = BCrypt::Password.new(self.password_digest)
        pw.is_password?(password)
    end

    def self.find_by_credentials(username, password)
        user = User.find_by(username: username)
        return nil unless user && user.is_password?(password)
        user
    end


    def ensure_session_token
        self.session_token ||= self.class.generate_session_token
    end

    def self.generate_session_token
        SecureRandom::urlsafe_base64
    end

    has_many :cats,
        foreign_key: :user_id,
        class_name: :Cat,
        dependent: :destroy

    has_many :requests,
        foreign_key: :user_id,
        class_name: :CatRentalRequest,
        dependent: :destroy 

end
