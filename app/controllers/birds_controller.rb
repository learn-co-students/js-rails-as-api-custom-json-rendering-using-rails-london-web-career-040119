class BirdsController < ApplicationController
  def index
    @birds = Bird.all
    render json: @birds
  end
 
 
  # commenting this out to limit what is made available on page.. (removing timestamps)
  # def show
  #   @bird = Bird.find(params[:id])
  #   render json: @bird
  # end 


 
  # def show
  #   @bird = Bird.find(params[:id])
  #   render json: {id: @bird.id, name: @bird.name, species: @bird.species } 
  # end 
  # -------->> Commenting this out show it also working with slice command 

  def show
    @bird = Bird.find(params[:id])
    render json: @bird.slice(:id, :name, :species)
  end
  # ---> works , but again, rails has a better way as seen below 


  # ---> While slice works fine for a single hash, as with @bird, it won't work for an array of hashes like the one we have in our index action:
  # -----------> 
  # In this case, we can add in the only: option directly after listing an object we want to render to JSON:

  def index
    @birds = Bird.all
    render json: @birds, only: [:id, :name, :species]
  end

#   Alternatively, rather than specifically listing every key we want to include, we could also exclude particular content using the except: option, like so:

# def index
#   @birds = Bird.all
#   render json: @birds, except: [:created_at, :updated_at]
# end

# Drawing Back the Curtain on Rendering JSON Data
# As we touched upon briefly in the previous lesson, the controller actions we have seen so far have a bit of Rails 'magic' in them that obscures what is actually happening when in the render statements. The only and except keywords are actually parameters of the to_json method. This method is implicitly called on the arrays and hashes we provide in the render json: statement, though we can still explicitly write it out if necessary. The last code snippet can be rewritten as the following to show what is actually happening:

# def index
#   @birds = Bird.all
#   render json: @birds.to_json(except: [:created_at, :updated_at])
# end
# This will work on our earlier, customized example as well, since it is just a hash:

# def show
#   @bird = Bird.find(params[:id])
#   render json: {id: @bird.id, name: @bird.name, species: @bird.species }.to_json
# end
# In upcoming lessons, we will look at the possibility of moving the work of customizing JSON data out of the controller. Once we are outside of controller actions and the Rails magic we get with them, it will be useful to know the to_json method.
  
end
