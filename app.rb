require "sinatra"
require "sinatra/reloader"

get("/howdy") do
  "hello there"
end


get("/square/new") do
  erb(:new_square_calc)
end

get("/square/results") do
 @the_num = params.fetch("users_number").to_f

 @the_result = @the_num ** 2

  erb(:square_results)
end

get("/square_root/new") do
  erb(:new_square_root_calc)
end

get("/square_root/results") do
  @the_num = params.fetch("users_number").to_f
 
  @the_result = Math.sqrt(@the_num) 
 
   erb(:square_root_results)
 end

 get("/random/new") do
  erb(:new_random_calc)
end

get("/random/results") do
  @min_value = params.fetch("user_min").to_f
  @max_value = params.fetch("user_max").to_f
  
  @random_number = rand(@min_value..@max_value)
 
   erb(:random_results)
 end

 get("/payment/new") do
  erb(:new_payment_calc)
end

require 'active_support/all'

get("/payment/results") do
  @annual_rate = params.fetch("user_apr").to_f
  @monthly_rate = (@annual_rate / 100) / 12
  
  @years = params.fetch("user_years").to_f
  @number_of_payments = @years * 12

  @present_value = params.fetch("user_pv").to_f

  @monthly_payment = (@monthly_rate * @present_value) / (1 - (1 + @monthly_rate)**(-@number_of_payments))


  @formatted_annual_rate = @monthly_rate.to_s(:percentage, precision: 4)
  @formatted_present_value = @present_value.to_s(:currency)
  @formatted_monthly_payment = @monthly_payment.to_s(:currency)
 
  erb(:payment_results)
end


get("/") do
  erb(:new_square_calc)
end
