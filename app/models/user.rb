class User < ApplicationRecord
  before_save { self.email = email.downcase }
  VALID_USERNAME_REGEX = /\A[a-zA-Z0-9]+\Z/
  validates :name, presence: { message: "用户名不填你注册个什么啊?"}, 
    length: { maximum: 40, too_long: "%{count}个字符是允许的最大值，你有这么长么?" }, 
    length: { minimum: 4, too_short: "%{count}个字符是允许的最小值，你想这么短么?" },
    format: { with: VALID_USERNAME_REGEX, message: "目前只允许用英文字母和数字注册"}
    
  VALID_EMAIL_REGEX = /\A(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})\z/i
    validates :email, presence: { message: "电子邮件也要填，可以乱填一个假的电子邮件"},
    length: { maximum: 40, too_long: "%{count}个字符是允许的最大值，这么长你记得住么？" },
    length: { minimum: 8, too_short: "%{count}个字符是允许的最小值，你怎么这么短?" },
    format: { with: VALID_EMAIL_REGEX, message: "电子邮件可以是假的，但是格式要正确！"},
    uniqueness: { case_sensitive: false }
    
  has_secure_password
  validates :password, presence: { message: "要填6位或以上的密码，比如123456 :)"}, 
  length: { minimum: 6, too_short: "密码太短了，最少也得%{count}位吧?" }
  
  validates :password_confirmation, presence: { message: "确认密码要填6位或以上的密码，并且要和上面相同。"}
end