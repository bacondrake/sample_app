class User < ActiveRecord::Base
  before_save { email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 6 }
end


#regular expressions (regex):
#as in the above valid_email_regex
=begin
/            #start of regex
\A           #match start of a string
[\w+\-.]+    #at least one (w)ord character, plus, hyphen or dot
@            #literal "at sign"
[a-z\d\-.]+  #at least one letter, (d)igit, hyphen, or dot
\.           #literal dot
[a-z]+       #at least one letter
\z           #match end of a string
/            #end of regex
i            #case insensitive

#Rubular can test regex - figure 6.4 in Hartl Rails Tutorial
=end