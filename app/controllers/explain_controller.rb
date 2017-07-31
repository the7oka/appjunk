class ExplainController < ApplicationController
  def index
    @title = 'اشرحلى كأنى فى خامسة ابتدائي'
  	@queries = Query.all
  	@explanations = Explanation.all
    if user_signed_in?
  	 @query = current_user.queries.build
    end
  end
  def show
    @queries = Query.all
    if user_signed_in?
      @newquery = current_user.queries.build
      @newexplanation = current_user.explanations.build
    end
  	@query = Query.find(params[:id])
    @title = 'فهمنى ' + @query.title + ' كأنى فى خامسة ابتدائي'
    @explanations = @query.explanations
  end
  def createquery
  	@query = current_user.queries.build(query_params)
  	@query.save
  	redirect_to '/explain'
  end
  def createexplanation
  	@query = Query.find(params[:id])
  	@explanation = current_user.explanations.build(explanation_params)
  	@explanation.query_id = @query.id
  	@explanation.save
  	redirect_to '/explain'
  end
  def like 
    @explaination = Explanation.find(params[:id])
    @explaination.liked_by current_user
    render :nothing => true
  end
  def unlike 
    @explaination = Explanation.find(params[:id])
    @explaination.unliked_by current_user
    render :nothing => true
  end
  def dislike 
    @explaination = Explanation.find(params[:id])
    @explaination.disliked_by current_user
    render :nothing => true
  end
  def undislike 
    @explaination = Explanation.find(params[:id])
    @explaination.undisliked_by current_user
    render :nothing => true
  end
  private 
  def query_params
  		params.require(:query).permit(:title,:querycategory_id)
  end
  def explanation_params
  		params.require(:explanation).permit(:explanation)
  end
end
