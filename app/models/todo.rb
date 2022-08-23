class Todo < ActiveRecord::Base
    belongs_to :category

    ## commenting out - having trouble
    ##if empty string, nil, or false it won't be stored in the database
    # validates :title, presence: true, uniqueness: true
end

