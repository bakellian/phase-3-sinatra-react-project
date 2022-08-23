class Todo < ActiveRecord::Base
    belongs_to :category

    #if empty string, nil, or false it won't be stored in the database
    validates :title, presence: true, uniqueness: true
end

