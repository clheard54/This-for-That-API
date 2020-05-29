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

Item.create(user_id: 1, title: "Toaster", description: "Used but totally functional", location: "Seattle", value: rand(200), seeking: "A haircut", image_photos: nil)
Item.create(user_id: random_user_id, title: "Gently used couch for 2", description: "Slightly worn, but clean and unstained. Super comfy.", location: "Asheville", value: rand(200), seeking: "Bed frame", image_photos: nil)
Item.create(user_id: random_user_id, title: "Starter plants: tomato, cucumber, zucchini", description: "Promising-looking starters if you want to hop on the home-garden bandwagon a little late!", location: "Burlington", value: rand(200), seeking: "Croquet set", image_photos: nil)
Item.create(user_id: random_user_id, title: "Kitchen appliances: toaster over, immersion blender, stand blender", description: "Used but totally functional", location: "Wash DC", value: rand(200), seeking: "Help w yarwork (heavy lifting)", image_photos: nil)
Item.create(user_id: random_user_id, title: "Body board (surfing)", description: "A little beat up and sun-worn, but your kid will love it!", location: "Houston", value: rand(200), seeking: "Steel-toed boots", image_photos: nil)
Item.create(user_id: random_user_id, title: "Old jeans, no holes", description: "Mens sizes 30-32ish", location: "Oakland", value: rand(200), seeking: "Pocketwatch", image_photos: nil)
Item.create(user_id: random_user_id, title: "Camping stove, 2-person tent", description: "Just finished the AT, so these are used, but totally serviceable", location: "DC", value: rand(200), seeking: "open to offers", image_photos: nil)
Item.create(user_id: random_user_id, title: "Home-cooked meal", description: "I'll take menu requests!", location: "Brooklyn", value: rand(200), seeking: "you tell me", image_photos: nil)
Item.create(user_id: random_user_id, title: "Barely-worn timerberland boots", description: "Used but totally functional", location: "NYC", value: rand(200), seeking: "High quality sleeping bag", image_photos: nil)

Service.create(user_id: 1, title: "Math tutoring", description: "High school math teacher, can teach anything up to BC calc level", location: "Tacoma", value: rand(200), seeking: "Hybrid bike", image_photos: nil)
Service.create(user_id: random_user_id, title: "Chinese lessons", description: "Native speaker. Will swap for chemistry tutoring.", location: "West Seattle", value: rand(200), seeking: "Tutor for son", image_photos: nil)
Service.create(user_id: random_user_id, title: "Swing dancing party", description: "Used but totally functional", location: "Seattle", value: rand(200), seeking: "A haircut", image_photos: nil)
Service.create(user_id: random_user_id, title: "Clown act", description: "Used but totally functional", location: "Bellevue", value: rand(200), seeking: "A haircut", image_photos: nil)
Service.create(user_id: random_user_id, title: "2hrs electric work", description: "Working electrician, so timing needs to be flexible", location: "DC", value: rand(200), seeking: "A haircut", image_photos: nil)
Service.create(user_id: random_user_id, title: "Plumbing fixes", description: "Former working plumber", location: "Portland", value: rand(200), seeking: "Cheap car repairs / new tires", image_photos: nil)
Service.create(user_id: random_user_id, title: "Any carpentry job", description: "Can do repairs, build basic furniture, fix cabinets or porches... Value determined by time needed for job.", location: "LA", value: rand(200), seeking: "Cordless vaccuum; Kitchenaid mixer", image_photos: nil)
Service.create(user_id: random_user_id, title: "Heavy lifting/moving", description: "Strong dude, will help with whatever you need", location: "San Francisco", value: rand(200), seeking: "Used boat", image_photos: nil)
Service.create(user_id: random_user_id, title: "Drive cross-country?", description: "If you need to get your car from one coast to another and you don't want to drive, I'll do it for you! I'm willing to pick up the car anywhere on the east coast between DC and Boston", location: "East -> West", value: rand(200), seeking: "The car to drive...", image_photos: nil)

Favorite.create(user_id: 1, offering_type: 'item', offering_id: 1)

random_user_id = rand(1..5)
random_offering_id = rand(1..10)

Message.create(user_id: 1, recipient: User.find(2), message: "Hi there", offering_type: 'item', offering_id: 1)
Message.create(user_id: random_user_id, recipient: User.find(random_user_id), message: "Hi there", offering_type: 'item', offering_id: random_offering_id)

