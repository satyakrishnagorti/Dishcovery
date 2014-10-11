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

  end
end
