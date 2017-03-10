# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin_role = Role.where(name: "Admin").first_or_create
customer_role = Role.where(name: "Customer").first_or_create

user_first = User.where(firstname: "Admin", lastname: "Kumar", contact_number: 95998840055, username: "admin.kumar", role: Role.where(name: "Admin").first, email: "admin.kumar@gmail.com", password: 111111).first_or_create

user_second = User.where(firstname: "Customer1", lastname: "Kumar", contact_number: 95998840056, username: "customer1.kumar", role: Role.where(name: "Customer").first, email: "customer1.kumar@gmail.com", password: 111111).first_or_create

user_third = User.where(firstname: "Customer2", lastname: "Kumar", contact_number: 95998840057, username: "customer2.kumar", role: Role.where(name: "Customer").first, email: "customer2.kumar@gmail.com", password: 111111).first_or_create

deal1 = Deal.where(title: "Mobile", description: "Moto Sale", price: 8000, discounted_price: 6500, quantity: 5, publish_date: DateTime.now.in_time_zone('Asia/Kolkata').change({ hour: 10, min: 0, sec: 0 }), image_path: "").first_or_create

deal2 = Deal.where(title: "Laptop", description: "Lenovo Sale", price: 28000, discounted_price: 26500, quantity: 4, publish_date: DateTime.now.in_time_zone('Asia/Kolkata').change({ hour: 10, min: 0, sec: 0 }) + 1.day, image_path: "").first_or_create
