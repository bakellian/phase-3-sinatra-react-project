puts "🌱 Seeding spices..."

category_one = Category.create(name: "Lily")
category_two = Category.create(name: "Chores")
category_three = Category.create(name: "Health")

Todo.create(
    title: "Buy dog food", 
    description: "The store is closed on friday so be sure to go before.", 
    category_id: category_one.id
)

Todo.create(
    title: "Clean apartment", 
    description: "AirBnB guest arrives on the 25th", 
    category_id: category_two.id
)

Todo.create(
    title: "Leg day", 
    description: "Gym closes at 10pm", 
    category_id: category_three.id
)
Todo.create(
    title: "Laundry", 
    description: "Don't forget to wash extra bed sheets", 
    category_id: category_two.id
)

puts "✅ Done seeding!"
