class Category < ActiveRecord::Base
    has_many :todos

    ##if empty string, nil, false, or repeated it won't be stored in the database
    validates :name, presence: true, uniqueness: true

end