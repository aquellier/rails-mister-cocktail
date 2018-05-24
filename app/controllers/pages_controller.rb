class PagesController < ApplicationController

  def home
    filter= "'%#{params[:search]}%'"
    @filter_form = params[:search]
    @cocktails = Cocktail.where("name LIKE #{filter}")
  end
end
