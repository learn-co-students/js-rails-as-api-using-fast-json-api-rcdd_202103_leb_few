# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!
rails g serializer Bird
rails g serializer Location
rails g serializer Sighting

class SightingSerializer
  include FastJsonapi::ObjectSerializer
  attributes :created_at
  belongs_to :bird
  belongs_to :location
end
def show
  sighting = Sighting.find_by(id: params[:id])
  options = {
    include: [:bird, :location]
  }
  render json: SightingSerializer.new(sighting, options)
end
