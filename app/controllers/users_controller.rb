class UsersController < ApplicationController

  def index
  end

  def show
    @gossips = Gossip.all
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    city = City.find_or_create_by(city_name: params[:city], zip_code: params[:zip_code])
    @user = User.new(first_name: params[:first_name], last_name: params[:last_name], city: city, description: params[:description], age: params[:age], email: params[:email], password: params[:password], city_id: City.last.id) # Méthode qui créé un potin à partir du contenu du formulaire de new.html.erb, soumis par l'utilisateur
    if @user.save
      flash[:success] = 'The Profile was successfully created'
      redirect_to gossips_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
