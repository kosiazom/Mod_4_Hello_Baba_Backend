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
    name: Faker::Commerce.product_name,
    price: Faker::Commerce.price,
    description: "Buy this NOW or you will regret it  >:), this is a warning not a threat!",
    stock: 1,
    product_img: "image",
    category: jewelery
    )
product2 = Product.create(
    name: Faker::Commerce.product_name,
    price: Faker::Commerce.price,
    description: "Do NOT let your fish near this product!",
    stock:2,
    product_img:"image2",
    category: electronics
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
    description:"Awful!, killed my pet fish :( never buying again R.I.P. Guppy jr"
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