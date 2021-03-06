# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'rest-client'
Category.destroy_all
Product.destroy_all
Order.destroy_all
Customer.destroy_all
Review.destroy_all

#make api get request 
products = RestClient.get("https://fakestoreapi.com/products")

#parse data into json array 
product_array = JSON.parse(products)

# Seeding Categories
electronics = Category.create(name:"electronics")
mens_clothing = Category.create(name: "men clothing")
jewelery = Category.create(name:"jewelery")
womens_clothing = Category.create(name:"women clothing")
childrens_clothing = Category.create(name:"childrens clothing")

# seeding customers 

customer1 =Customer.create(
    username:Faker::Name.name,
    password_digest:"password", 
    shipping_address:Faker::Address.full_address
)
customer2 = Customer.create(
    username:Faker::Name.name,
    password_digest:"PWD",
    shipping_address:Faker::Address.full_address
)
# seeding products

product_array.each do |product|
   random_value = rand 10..100
    category = Category.find_by name: product["category"]
    Product.create(
        name:product["title"],
        price: product["price"],
        description: product["description"],
        category: category,
        product_img: product["image"],
        stock: random_value
    )
end


 product = Product.create(
    name: "Womens Phoenix Costume",
    price: 10.31,
    description: "Buy this NOW or you will regret it  >:), this is a warning not a threat!",
    stock: 1,
    product_img: "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/1dbc1935-6542-4ee3-822f-135cff4ba62c/d9lcor7-31e34329-db9a-4de0-9afc-338eacd479bd.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOiIsImlzcyI6InVybjphcHA6Iiwib2JqIjpbW3sicGF0aCI6IlwvZlwvMWRiYzE5MzUtNjU0Mi00ZWUzLTgyMmYtMTM1Y2ZmNGJhNjJjXC9kOWxjb3I3LTMxZTM0MzI5LWRiOWEtNGRlMC05YWZjLTMzOGVhY2Q0NzliZC5wbmcifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6ZmlsZS5kb3dubG9hZCJdfQ.JZjV9JEowLLPy8pWArAp8rIijuLBt2ZpbCZBLKKYq7g",
    category: womens_clothing
    )
product2 = Product.create(
    name:"Mens Zombie Costume",
    price: 10.31,
    description: "Do NOT let your pets near this product!",
    stock:2,
    product_img:"https://s1.cnnx.io/bizrate/editorial/0909_halloween/HalloweenMen_ZombieCostume1.png",
    category: electronics
)

product3 = Product.create(
    name: "Mens Joker Costume",
    price: 10.31,
    description: "HAHHAHAHAHAH ",
    stock:3,
    product_img: "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/5b8d2b12-21e8-4931-8a6d-fb9ecdd60383/ddhlq1q-7e42694d-bb18-4a1a-9125-49e12e023108.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOiIsImlzcyI6InVybjphcHA6Iiwib2JqIjpbW3sicGF0aCI6IlwvZlwvNWI4ZDJiMTItMjFlOC00OTMxLThhNmQtZmI5ZWNkZDYwMzgzXC9kZGhscTFxLTdlNDI2OTRkLWJiMTgtNGExYS05MTI1LTQ5ZTEyZTAyMzEwOC5wbmcifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6ZmlsZS5kb3dubG9hZCJdfQ.Fxu32f_9UotrU3jt5zVnDgasSJSc8HuFxqVG08F3a6A",
    category:mens_clothing
)
product4 = Product.create(
    name: "Childrens Wizard Costume",
    price: 10.31,
    description:"You're a wizard INSERT YOUR CHILD'S NAME",
    stock:5,
    product_img: "https://pngriver.com/wp-content/uploads/2018/04/Download-Halloween-Costume-PNG-File.png",
    category: childrens_clothing
)

#seeding reviews already on the website

review = Review.create(
    customer_id:customer1.id,
    product: product,
    description:"This wAs AMazing if i had a dollar for each time this product made me happy I would buy the whole COMPANY "
)

review2 = Review.create(
    customer_id:customer2.id,
    product:product2,
    description:"Awful! I turned into a zombie and killed my pet fish :( never buying again R.I.P. Guppy jr"
)

#seeding orders already on the website 

    
order = Order.create(
    customer: customer1,
    order_date:"Today", 
    product: product, 
    quantity:1
)

order2= Order.create(
    customer_id:customer2.id,
    order_date:"February 22nd, 2020",
    product:product2,
    quantity:2
)