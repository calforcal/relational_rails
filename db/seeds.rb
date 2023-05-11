# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Bikeshop.destroy_all
Servicerequest.destroy_all

bikeshop = Bikeshop.create!(name: "UBikes", employees: 25, rewards_program: false)
bikeshop_2 = Bikeshop.create!(name: "Full Cycle", employees: 45, rewards_program: true)
bikeshop_3 = Bikeshop.create!(name: "Community Cycles", employees: 10, rewards_program: false)
bikeshop_4 = Bikeshop.create!(name: "My Shed", employees: 1, rewards_program: false)
service_request_1 = Servicerequest.create!(bike_from_shop: true, estimated_cost: 200, customer_name: "Michael Callahan", bike_type: "Road", bikeshop_id: bikeshop.id)
service_request_2 = Servicerequest.create!(bike_from_shop: false, estimated_cost: 40, customer_name: "Primoz Roglic", bike_type: "Gravel", bikeshop_id: bikeshop_2.id)
service_request_3 = Servicerequest.create!(bike_from_shop: true, estimated_cost: 120, customer_name: "Thomas Pidcock", bike_type: "MTB", bikeshop_id: bikeshop_3.id)
service_request_4 = Servicerequest.create!(bike_from_shop: true, estimated_cost: 100, customer_name: "Jan Hirt", bike_type: "Gravel", bikeshop_id: bikeshop.id)
service_request_5 = Servicerequest.create!(bike_from_shop: false, estimated_cost: 70, customer_name: "Tadej Pogacar", bike_type: "Fixie", bikeshop_id: bikeshop_2.id)
service_request_6 = Servicerequest.create!(bike_from_shop: true, estimated_cost: 600, customer_name: "Filippo Ganna", bike_type: "MTB", bikeshop_id: bikeshop_3.id)
service_request_7 = Servicerequest.create!(bike_from_shop: true, estimated_cost: 20, customer_name: "Geraint Thomas", bike_type: "Gravel", bikeshop_id: bikeshop.id)
service_request_8 = Servicerequest.create!(bike_from_shop: false, estimated_cost: 250, customer_name: "Joao Almeida", bike_type: "Road", bikeshop_id: bikeshop_2.id)
service_request_9 = Servicerequest.create!(bike_from_shop: true, estimated_cost: 120, customer_name: "Hugh Carthy", bike_type: "MTB", bikeshop_id: bikeshop_3.id)