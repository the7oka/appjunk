class DictionaryController < ApplicationController
	def new
		@title = 'Evolved Dictionary'
		@definitions = Definition.all.reverse
		@word = Word.new
		if user_signed_in?
			@definition = current_user.definitions.build
		end
	end
	def show
		@newword = Word.new
		if user_signed_in?
			@definition = current_user.definitions.build
		end
		@word = Word.find(params[:id])
		@title ="معنى كلمة "+ @word.word + ' | القاموس المطور'
	end
	def search
		@newword = Word.new
		if user_signed_in?
			@definition = current_user.definitions.build
		end
		@title = 'Evolved Dictionary'
		@words = Word.where("word LIKE ?" , params[:search])
	end
	def random
		@newword = Word.new
		if user_signed_in?
			@definition = current_user.definitions.build
		end
		@title = 'Evolved Dictionary'
		@word = Word.order("RANDOM()").first
	end
	def create
		@word = Word.where(word_params).first_or_create do |word|
		end
				@definition = current_user.definitions.build(definition_params)
				@definition.word_id = @word.id
				if @definition.save
					redirect_to "/dictionary"
				else 
					redirect_to "/"
				end
	end
	def like 
    @definition = Definition.find(params[:id])
    @definition.liked_by current_user
    render :nothing => true
  end
  def unlike 
    @definition = Definition.find(params[:id])
    @definition.unliked_by current_user
    render :nothing => true
  end
  def dislike 
    @definition = Definition.find(params[:id])
    @definition.disliked_by current_user
    render :nothing => true
  end
  def undislike 
    @definition = Definition.find(params[:id])
    @definition.undisliked_by current_user
    render :nothing => true
  end
private
	def word_params
		params.require(:word).permit(:word)
	end

	def definition_params 
		params.require(:definition).permit(:definition, :example)
	end
end

