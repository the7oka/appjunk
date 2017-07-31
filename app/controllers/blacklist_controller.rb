class BlacklistController < ApplicationController
  def index
    @catid = ""
    @comid = ""
    @categoriess = Category.order('name ASC')
    if user_signed_in? && current_user.admin? 
      @complaints = Complaint.paginate(:page => params[:page], :per_page => 30).order('created_at DESC')
    else
      @complaints = Complaint.where('approved = ?', true)
      @complaints = @complaints.paginate(:page => params[:page], :per_page => 30).order('created_at DESC')
    end
    @title = "Shopping Blacklist"
    if user_signed_in?
      @complaint = current_user.complaints.build
    end
  end

  def show_company
    @title = "Shopping Blacklist"
    @categoriess = Category.order('name ASC')
    @complaint = current_user.complaints.build
    @company = Company.find(params[:id])
    @comid = @company.id
    @catid = @company.category_id
    @complaints = Complaint.where("company_id = ?" , params[:id])
    @complaints = @complaints.where('approved = ?', true)
    @complaints = @complaints.paginate(:page => params[:page], :per_page => 9)
  end
  def show_category 
    @title = "Shopping Blacklist"
    @categoriess = Category.order('name ASC')
    @complaint = current_user.complaints.build
    @category = Category.find(params[:id])
    @catid = @category.id
    @comid = ""
    @companies = Company.where("category_id = ?" , params[:id])
    @complaints = Complaint.where(company_id: @companies.pluck(:id))
    @complaints = @complaints.where('approved = ?', true)
    @complaints = @complaints.paginate(:page => params[:page], :per_page => 9)
  end

  def companyindex
    @company = Company.find(params[:id])
    @complaints = @company.complaints
  end

  def new
    @complaint = current_user.complaints.build
  end

  def show
    @title = "Shopping Blacklist"
    @complaint = Complaint.find(params[:id])
    @complaintcomments = Complaintcomment.where("complaint_id=?" , params[:id]).order(:cached_votes_up).reverse
  end

  def edit
    @complaint = Complaint.find(params[:id])
    @theman = @complaint.user
    if current_user == @theman || curretn_user.admin == true
    @comid = @complaint.company_id
    @company = Company.find(@comid)
    @catid = @company.category_id
    end
  end
  def constants
    if current_user.admin == true
      @categories = Category.all
      @category = Category.new
      @companies = Company.all
      @company = Company.new
    end
  end

  def create_category
    if current_user.admin == true
    @category = Category.new(category_params)
  end
    if @category.save
      redirect_to "/blacklist/constants"
    else
      render "/blacklist/constants"
    end
  end
  def create_company
    if current_user.admin == true
    @company = Company.new(company_params)
  end
    if @company.save
      redirect_to "/blacklist/constants"
    else
      render "/blacklist/constants"
    end
  end
  def create
    @complaint = current_user.complaints.build(complaint_params)
    if @complaint.save
      redirect_to "/blacklist"
    else
      render "/blacklist/constants"
    end
  end
  def update
    @complaint = Complaint.find(params[:id])
    @theman = @complaint.user
    if current_user == @theman || current_user.admin == true
      if @complaint.update(complaint_params)
        redirect_to @complaint
      end
    end
  end

  def valid 
    @complaint = Complaint.find(params[:id])
    @complaint.liked_by current_user
    render :nothing => true
  end
  def unvalid 
    @complaint = Complaint.find(params[:id])
    @complaint.unliked_by current_user
    render :nothing => true
  end
  def invalid 
    @complaint = Complaint.find(params[:id])
    @complaint.disliked_by current_user
    render :nothing => true
  end
  def uninvalid 
    @complaint = Complaint.find(params[:id])
    @complaint.undisliked_by current_user
    render :nothing => true
  end
  def approve
    if current_user.admin == true
      @complaint = Complaint.find(params[:id])
      @complaint.approved = true
      @complaint.save
      render :nothing => true
    else
      redirect_to"/"
    end

  end







  private 
  def complaint_params
    params.require(:complaint).permit(:company_id, :content, :photo_one, :photo_two, :photo_three, :companymanual)
  end
  def company_params
    params.require(:company).permit(:category_id, :name)
  end
  def category_params
    params.require(:category).permit(:name)
  end

end
