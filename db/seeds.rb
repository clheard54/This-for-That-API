# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = ["antiques", "appliances", "arts+crafts", "cars/trucks/motorcycles", "beauty+health", "bikes", "books", "clothes+accessories", "electronics", "farm+garden", "furniture", "kids+babies", "materials", "music", "sports+equipment", "tech", "tickets", "tools", "toys+games", "babysitting", "beauty+health", "caretaking", "cleaning", "cooking", "creative", "driving", "education", "finances", "fitness", "legal services", "medical services", "miscellaneous", "pets+pet care", "physical labor+moving", "real estate", "skilled trade: plumbing, electric, automotive", "tech help", "yardwork: farm+garden"]

def createTags
    categories.map {|tag|
    Tag.create(category: tag)
    }
end

createTags()

User.create(first_name: "Susie", last_name: "Q", username: "susieQ", password: "1234", email: "susieQ@gmail.com", location: "Seattle")
User.create(first_name: "Clarion", last_name: "Heard", username: "clh", password: "asdf", email: "cheard@gmail.com", location: "Seattle")
User.create(first_name: "Emma", last_name: "Gross", username: "ejg", password: "arch", email: "ejg@gmail.com", location: "Annapolis")
User.create(first_name: "Caroline", last_name: "Gilman", username: "carol", password: "123", email: "carol@gmail.com", location: "New Jersey")
User.create(first_name: "Jenny", last_name: "Aguiar", username: "jaguar", password: "jag", email: "jag@gmail.com", location: "Boston")

Item.create(user_id: 1, title: "Toaster", description: )
t.integer :user_id
      t.string :title
      t.string :description
      t.string :location
      t.string :seeking
      t.float :value
