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

get("/") do
  erb(:new_square_calc)
end
