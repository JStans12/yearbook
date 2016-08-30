class IdentificationsController < ApplicationController
  def new
    @identification = Identification.new
  end
end
