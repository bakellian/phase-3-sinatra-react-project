class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    { message: "Good luck with your project!" }.to_json
  end

  get '/categories' do
    category = Category.all
    category.to_json
  end

  ## Error handling post request:

  post '/categories' do 
    category = Category.create(
      name: params[:name]
    )
    # now run it through validations - if it saves 
    if category.save
      category.to_json
    else
      { errors: category.errors.full_messages }.to_json
    end
  end

  get '/todos' do 
    @todos = Todo.all
    #going to grab the todos and their categories and parse to json
    @todos.to_json(include: [:category])
  end

  post "/todos" do 
     todo = Todo.new(
       title: params[:title],
       description: params[:description],
       category_id: params[:category_id]
     )
     if todo.save
       todo.to_json(include: [:category])
     else
       { errors: todo.errors.full_messages }.to_json
     end
  end

end
