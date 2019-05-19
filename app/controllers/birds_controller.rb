class BirdsController < ApplicationController
  # def index
  #   @birds = Bird.all
  #   render json: @birds
  # end

  # def index
#   @birds = Bird.all
#   render json: @birds, only: [:id, :name, :species]
# end

# alternatively you could 

# def index
#   @birds = Bird.all
#   render json: @birds, except: [:created_at, :updated_at]
# end
 
#   def show
#     @bird = Bird.find(params[:id])
#     render json: @bird
#   end
# 

#  so we just have the relevant information we can say exactly what we want to render

# def show
#   @bird = Bird.find(params[:id])
#   render json: {id: @bird.id, name: @bird.name, species: @bird.species } 
#  end
# 

# Another option would be to use Ruby's built-in slice method. On the show action, that would look like this:

# def show
#   @bird = Bird.find(params[:id])
#   render json: @bird.slice{:id, :name, :species}
# end

# Rails has one better. While slice works fine for a single hash, as with @bird, it won't work for an array of hashes 
# In this case, we can add in the only: option directly after listing an object we want to render to JSON:

def index
  @birds = Bird.all
  render json: @birds.to_json(except: [:created_at, :updated_at])
end

def show
  @bird = Bird.find(params[:id])
  render json: {id: @bird.id, name: @bird.name, species: @bird.species }.to_json
end



end 
