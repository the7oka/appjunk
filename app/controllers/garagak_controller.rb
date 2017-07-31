class GaragakController < ApplicationController
  def index
    @title = 'Garagak'
  end
  def new 
    @title = 'Garagak'
    @user = current_user
    @carlisting = Carlisting.new
  end
  def search 
    @title = 'Garagak'
    @carlistings = Carlisting.all
    if params[:carbrand_id]
      if params[:carbrand_id] != "" 
      @models = Carmodel.where("carbrand_id = ?" , params[:carbrand_id])
      @carlistings = @carlistings.where(carmodel_id: @models.pluck(:id))
      end
      if params[:carmodel_id] != ""  
        @carlistings = @carlistings.where("carmodel_id=?" , params[:carmodel_id])
      end
      if params[:cartype_id] != ""
        @carlistings = @carlistings.where("cartype_id=?" , params[:cartype_id])
      end
      if params[:area_id] != ""
        @carlistings = @carlistings.where("area_id=?" , params[:area_id])
      end
      if params[:fromyear] != ""
        @carlistings = @carlistings.where("year>=?" , params[:fromyear])
      end
      if params[:toyear] != ""
        @carlistings = @carlistings.where("year<=?" , params[:toyear])
      end
      if params[:engine] != ""
        @carlistings = @carlistings.where("engine=?" , params[:engine])
      end
      if params[:fromkm] != ""
        @carlistings = @carlistings.where("milleage>=?" , params[:fromkm])
      end
      if params[:tokm] != ""
        @carlistings = @carlistings.where("milleage<=?" , params[:tokm])
      end
      if params[:fromprice] != ""
        @carlistings = @carlistings.where("price>=?" , params[:fromprice])
      end
      if params[:toprice] != ""
        @carlistings = @carlistings.where("price<=?" , params[:toprice])
      end
      if params[:tire] != ""
        @carlistings = @carlistings.where("tire<=?" , params[:tire])
      end
      if params[:automatic] != nil
        @carlistings = @carlistings.where("automatic=?" , params[:automatic])
      end
      if params[:fourdoor] != nil
        @carlistings = @carlistings.where("fourdoor=?" , params[:fourdoor])
      end
      if params[:ac] != nil
        @carlistings = @carlistings.where("ac=?" , params[:ac])
      end
      if params[:electricwindow] != nil
        @carlistings = @carlistings.where("electricwindow=?" , params[:electricwindow])
      end
      if params[:sunroof] != nil
        @carlistings = @carlistings.where("sunroof=?" , params[:sunroof])
      end
      if params[:abs] != nil
        @carlistings = @carlistings.where("abs=?" , params[:abs])
      end
      if params[:ebd] != nil
        @carlistings = @carlistings.where("ebd=?" , params[:ebd])
      end
      if params[:centerlock] != nil
        @carlistings = @carlistings.where("centerlock=?" , params[:centerlock])
      end
      if params[:alarm] != nil
        @carlistings = @carlistings.where("alarm=?" , params[:alarm])
      end
      if params[:cruisecontrol] != nil
        @carlistings = @carlistings.where("cruisecontrol=?" , params[:cruisecontrol])
      end
      if params[:powersteering] != nil
        @carlistings = @carlistings.where("powersteering=?" , params[:powersteering])
      end
      if params[:electricmirror] != nil
        @carlistings = @carlistings.where("electricmirror=?" , params[:electricmirror])
      end
      if params[:foldingmirror] != nil
        @carlistings = @carlistings.where("foldingmirror=?" , params[:foldingmirror])
      end

      if params[:airbag] != nil
        @carlistings = @carlistings.where("airbag=?" , params[:airbag])
      end
      if params[:music] != nil
        @carlistings = @carlistings.where("music=?" , params[:music])
      end
    end
    @cartlistings = @carlistings.paginate(:page => params[:page], :per_page => 10)
  end
  def create
  	@carlisting = current_user.carlistings.build(carlisting_params)
  	if @carlisting.save
  		redirect_to "/garagak"
  	else 
  		redirect_to "/"
  	end
  end
  def edit
    @carlisting=Carlisting.find(params[:id])
  end
  def update
    @carlisting = Carlisting.find(params[:id])
    if @carlisting.update(carlisting_params)
      redirect_to "/garagak/constants"
    else 
      redirect_to "/garagak"
    end
  end
  def constants
    @carbrand = Carbrand.new
    @carmodel = Carmodel.new
    @city = City.new
    @area = Area.new
    @carbrands = Carbrand.all
    @carmodels = Carmodel.all
    @cities = City.all
    @areas = Area.all
  end
  def create_carbrand
    @carbrand = Carbrand.new(carbrand_params)
    if @carbrand.save
      redirect_to "/garagak/constants"
    else 
      redirect_to "/garagak"
    end
  end
  def edit_carbrands
    @carbrand = Carbrand.find(params[:id])
  end
  def update_carbrand
    @carbrand = Carbrand.find(params[:id])
    if @carbrand.update(carbrand_params)
      redirect_to "/garagak/constants"
    else 
      redirect_to "/garagak"
    end
  end
  def create_carmodel
    @carmodel = Carmodel.new(carmodel_params)
    if @carmodel.save
      redirect_to "/garagak/constants"
    else 
      redirect_to "/garagak"
    end
  end
  def create_city
    @city = City.new(city_params)
    if @city.save
      redirect_to "/garagak/constants"
    else 
      redirect_to "/garagak"
    end
  end
  def create_area
    @area = Area.new(area_params)
    if @area.save
      redirect_to "/garagak/constants"
    else 
      redirect_to "/garagak"
    end
  end
  private 
  def carlisting_params
  	params.require(:carlisting).permit(:carmodel_id, :details, :area_id, :cartype_id, :automatic, :fourdoor, :year, :engine, :fourdoor, :year, :engine, :milleage, :price, :tire, :ac, :electricwindow, :sunroof, :abs, :ebd, :centerlock, :alarm, :cruisecontrol, :powersteering, :airbag, :music, :electricmirror, :foldingmirror, :phone, :photo_one, :photo_two, :photo_three)
  end
  def carbrand_params
    params.require(:carbrand).permit(:name, :photo)
  end
  def carmodel_params
    params.require(:carmodel).permit(:name, :carbrand_id)
  end
  def city_params
    params.require(:city).permit(:name)
  end
  def area_params
    params.require(:area).permit(:name, :city_id)
  end
end