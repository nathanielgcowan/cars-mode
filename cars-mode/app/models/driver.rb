class Driver < ActiveRecord::Base
    has_secure_password
    has_many :create_posts
end
 