class Users::SignIn < ActiveType::Object
  attribute :username, :string
  attribute :password, :string

  validates :password, presence: true
  validates :username, presence: true

  validate :validate_user_exists
  validate :validate_password_correct, if: Proc.new {|sign| sign.username}

  def user
    @user ||= User.find_by_username(username)
  end

  def token
    @token ||= generate_token
  end

  private

  def validate_user_exists
    user
  end

  def validate_password_correct
    if user && !user.authenticate(password)
      errors.add(:password, {status: 10001, msg: "用户名不对或者密码错误
"})
    end
  end

  def generate_token
    auth_token = Users::AuthToken.create(user: user)
    auth_token.token
  end
end
