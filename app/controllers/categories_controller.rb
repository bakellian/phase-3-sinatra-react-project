class CategoriesController < ApplicationController

    #get all of the categories so we have options to select from in the form 
    get '/categories' do
        category = Category.all
        category.to_json
    end
    
end