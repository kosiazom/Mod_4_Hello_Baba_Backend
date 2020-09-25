# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
Category.destroy_all
Product.destroy_all
Order.destroy_all
Customer.destroy_all
Review.destroy_all

 apparel = Category.create(name:"Apparel")

 customer =Customer.create(
    username:"Fred",
    password_digest:"password", 
    shipping_address:"123 Flatiron RD"
    )
 product = Product.create(
    name: Faker::Commerce.product_name,
    price: Faker::Commerce.price,
    description: "a",
    stock: 1,
    product_img: "image",
    category: apparel
    )
        
 review = Review.create(
    customer_id:customer.id,
    product: product,
    description:"This wAs AMazing"
    )
    
    
order = Order.create(
    customer: customer,
    order_date:"Today", 
    product: product, 
    quantity:1
    )