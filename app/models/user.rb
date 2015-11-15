require 'jwt'
class User < ActiveRecord::Base

  has_many :answers
  has_many :questions

  has_secure_password

  before_create :generate_token

  validates :email, :name, uniqueness: true
  validates :email, :name, presence: true


  def self.decode_token(token)
    begin
      jwt, _ = token.try(:split, ' ')
      return false unless jwt
      payload, header = JWT.decode(jwt, nil, false, verify_expiration: false)
      account = User.find_by_name(payload["name"])
      secret = account ? account.auth_token : ""
      # ＃用秘钥验证令牌，会抛出 JWT::ExpiredSignature 或 JWT::DecodeError 异常
      payload, header = JWT.decode(jwt, secret)
      # ＃验证成功，设置当前用户
      account
    rescue JWT::DecodeError => e
      nil
    end
  end

  def regenerate_auth_token
    generate_token
  end

  def encode_user
    JWT.encode(payload, auth_token, 'HS256')
  end

  def payload
    {name: name, email: email}
  end

  private

  def generate_token
    self.auth_token = name + Time.now.to_s
  end
end
