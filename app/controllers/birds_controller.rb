class BirdsController < ApplicationController
 #! Rendering in json 
  def index
    @birds = Bird.all
    # render 'birds/index.html.erb'
    #*rendering plain text
    # render plain: "Hello #{@birds[3].name}"
    #*endering hashes in json
    # render json: { message: 'Hashes of data will get converted to JSON' }
    #*render arrays in json 
    # render json: ['As','well','as','arrays']
    #* rendering objects
    # render json: @birds
    #! Custom Nested ones too 
    render json: { birds: @birds, messages: ['Hello Birds', 'Goodbye Birds'] }

  end

#! Removing content when Rendering - may not want to send the entire model so I will pick
def show 
  bird = Bird.find_by(id: params[:id])
  # render json: {id: bird.id, name: bird.name, species: bird.species} 
  #* could also use slice
  # render json: bird.slice(:id,:name:species)
  #* better option to be specific
  # render json: bird, only: [:id,:name,:species]
  #* alternatively can choose to exluse
  render json: bird, except: [:created_at, :updated_at] 
  #  this is how it looked behind the scenes:  render json: birds.to_json(except: [:created_at, :updated_at])
end

#!Basic error messagin when rendering JSON data
def show
  bird = Bird.find_by(id: params[:id]) #if the bird is not found bird is assigned nil value this is falsey 
  if bird
    render json: bird, except: [:created_at, :updated_at] 
  else
    render json: { message: 'Bird not found' }
  end
end

end