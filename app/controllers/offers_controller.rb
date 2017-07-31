class OffersController < ApplicationController
	def index
		@title = 'Shop'
		@offers = Offer.all
	end
	def show
		@offer = Offer.find(params[:id])
		@title = 'Shop'+@offer.title
		if @offer.votes_for.size != 0
		@offerrate = (@offer.get_likes.size - @offer.get_dislikes.size)/@offer.votes_for.size
		else 
		@offerrate = 0
		end
	end
	def search
		@title = 'Shop'
		@offers = Offer.where("category_id = ?", params[:category_id])
	end
	def new
		@title = 'Shop'
		@offer = Offer.new
	end
	def create
		@offer = current_user.offers.build(offer_params)
		if @offer.save
			redirect_to "/offers/new"
		else 
			redirect_to "/"
		end
	end
	def offerrequest
		@offerrequest = current_user.offerrequests.build
		@offer = Offer.find(params[:offer_id])
	end
	def create_offerrequest
		@offerrequest = current_user.offerrequests.build(offerrequest_params)
		@offerrequest.offer_id = params[:offer_id]
		if @offerrequest.save
			redirect_to '/offers'
		end

	end
	def constants
		@offercategory = Offercategory.new
		@offercategories = Offercategory.all
	end
	def create_offercategory
		@offercategory = Offercategory.new(offercategory_params)
		if @offercategory.save
			redirect_to "/offers/constants"
		else 
			redirect_to "/"
		end
	end
	def approve
		@request = Offerrequest.find(params[:id])
		@theman = @request.offer.user
		if current_user = @theman
			@request.accepted = true
			@request.save
			render :nothing => true
		end
	end
	def approve
		@request = Offerrequest.find(params[:id])
		@theman = @request.user
		if current_user = @theman
			@request.delivered = true
			@request.save
			render :nothing => true
		end
	end
	def like 
    @offer = Offer.find(params[:id])
    @offer.liked_by current_user
    render :nothing => true
	end
	def unlike 
	@offer = Offer.find(params[:id])
	@offer.unliked_by current_user
	render :nothing => true
	end
	def dislike 
	@offer = Offer.find(params[:id])
	@offer.disliked_by current_user
	render :nothing => true
	end
	def undislike 
	@offer = Offer.find(params[:id])
	@offer.undisliked_by current_user
	render :nothing => true
	end
	private
	def offer_params
		params.require(:offer).permit(:title, :offercategory_id, :photo, :details, :delivery)
	end
	def offercategory_params
		params.require(:offercategory).permit(:name)
	end
	def offerrequest_params
		params.require(:offerrequest).permit(:offer_id, :quantity, :details)
	end
end
