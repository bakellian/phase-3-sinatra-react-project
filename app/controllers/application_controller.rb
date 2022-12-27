class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  get '/categories' do
    category = Category.all
    category.to_json(include: [:todos])   
  end

  ## Error handling post request:
  

  post '/categories' do 
    category = Category.create(params[:name])
    # now run it through validations - if it saves 
    if category.save
      category.to_json
    else
      { errors: category.errors.full_messages }.to_json
    end
  end

  get '/todos' do 
    @todos = Todo.all
    @todos.to_json(include: [:category])
  end

  post "/categories/:category_id/todos" do 
    category = Category.find_by_id(params[:category_id])
    #makes new todo in this category w/o saving (rtrns association obj)
    todo = category.todos.build(params[:toDoData])
     if todo.save
       todo.to_json(include: [:category])
     else
       { errors: todo.errors.full_messages }.to_json
     end
  end

  # need to create an update 
  patch '/todos/:id/edit' do #reqiest from front end needs to match what we have in the route 
    #1. find donation to update
    todo = Todo.find(params[:id])
    #call method .update and pass in the parameters being updated 
    todo.update({
        title: params[:title],
        description: params[:description]
    })
    todo.to_json
  end


  delete "/todos/:id" do 
    todo = Todo.find_by_id(params[:id])
    if todo
      todo.destroy
      #send back to front end so we can find it in front end and delete it to match backend
      todo.to_json(include: [:category])
    else 
      { errors: ["Todo does not exist"] }.to_json
    end 
  end

end
