class PagesController < ApplicationController
  def home
  end

  def results
=begin
    @value = params[:key]
    puts @value
=end
    @locations = []
    @restaurants = []
    @r_names = []
    @selected_cuisine = ""
    @cuisines = ['Chinese', 'Bakery']
    @cuisines.each do |x|
      if x == params[x]
        @selected_cuisine = x
        puts @selected_cuisine
        break
      end
    end
    @selected_cuisine = 'Chinese'
    Location.find_each do |a|
      if a.loc_name == params[a.loc_name]
        @locations.append a.loc_name
=begin
        restaurants = Restaurant.where('loc_name', params[a.loc_name])
        restaurants.find_each do |b|
          @restaurants.append b.name
        end
=end


        Restaurant.find_each do |c|
          if c.location == params[a.loc_name]
            @restaurants.append c
          end
        end

      end
    end

    @res = algorithm(["Brigade Road","BTM"],@selected_cuisinee)

  end

  def algorithm(locations,cuisine)
    rests = {}
    locations.each do |each_loc|
      rest_in_loc = []
      selected_rest = Restaurant.where("location == '"+each_loc+ "' and cuisines like '%"+cuisine+"%'").limit(8).each do |x|
        puts x.name

        if x.cuisines.include? each_loc
          rest_in_loc.append x
        end
      end
      rests[each_loc] = rest_in_loc
    end
    return rests

=begin


    base_score = 100
    ret_cost=[]
    ret_loc = []
    rest_hash = {}

    selected_restaurants = []
    Restaurant.find_each do |c|         #finds main_score and adds to hash
      if c.cuisines[cuisine] and locations.include?c.location
        selected_restaurants.append c
      end
    end

    cost_for_two_tot = 0
    cost_count = 0
    sum =0
    count = 0

    selected_restaurants.each do |s|
      cost_for_two_tot+=s.cost_for_two.to_i
      cost_count+=1

      ReviewCount.find_each do |x|           #finds average review count
        if x.rest_id == s.rest_id

        sum += x.rev_count.to_i
        count +=1
        end
      end

    end
    average_cost_for_two = cost_for_two_tot/cost_count
    average_review_count = sum/count


    selected_restaurants.each do |c|
        if c.rating.to_i>3.2 and c.cost_for_two.to_i >=average_cost_for_two
          k = 2
        elsif c.rating.to_i>3.2 and c.cost_for_two.to_i < average_cost_for_two
          k=5
        elsif c.rating.to_i<3.2 and c.cost_for_two.to_i<average_cost_for_two
          k=-1
        else k = -3
        end

        diff = (c.cost_for_two.to_i-average_cost_for_two).abs
        bonus = k*(Math.sqrt(diff))
        rev_count = ReviewCount.where("rest_id = ?", c.rest_id).first.rev_count
        m1 = if rev_count.to_i < average_review_count then 3 else 5 end
        main_score = base_score -(3.2 - c.rating.to_i)*m1 + bonus
        rest_hash[c.name] = main_score
    end


    rest_hash.each do |key,value|
      print key
      print "--->"
      puts value
    end
=end
  end
 end






