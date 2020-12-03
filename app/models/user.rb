class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validate :password_comfirm
  before_create :encrypt_password

  def self.login(options)
    if options[:email] && options[:password]
      find_by(email: options[:email],
              password: Digest::SHA1.hexdigest("yu" + options[:password] +"an"))
    end
  end

  private
  def encrypt_password
    self.password = bigbang(self.password)
    self.comfirmation = bigbang(self.comfirmation)
  end

  def bigbang(string)
    string = "yu" + string + "an"
    Digest::SHA1.hexdigest(string)
  end

  def password_comfirm
    if self.password == self.comfirmation
      true
    else
      false
    end
  end
end
