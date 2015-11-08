require 'jwt'
class Users::AuthToken < ActiveType::Object
  attribute :user
  attribute :token, :string

  before_save :encode_user
  before_save :decode_token

  private

  def encode_user
    self.token ||= JWT.encode(payload, "3tWqgwXg7tmZmwLT", 'HS256')
  end

  def decode_token
    begin
      data, header = JWT.decode(token, "3tWqgwXg7tmZmwLT")
    rescue JWT::DecodeError => e
      errors.add(:base, { status: 40018, msg: "用户token验证错误"})
      raise_record_invalid
    end
  end

  def payload
    {
      name: user.name,
      email: user.email,
    }
  end
end
