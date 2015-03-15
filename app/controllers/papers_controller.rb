class PapersController < ApplicationController
  before_action :set_paper, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  
  has_scope :featured, :type => :boolean
  has_scope :by_type_of_conference
  respond_to :html

  def index
    @papers = apply_scopes(Paper).all
    if current_user.email != "admin@ncrtet2015.com"
      if @papers.find_by_user_id(current_user.id)

       else
        redirect_to new_paper_path
      end
    else
      respond_to do |format|
        format.html
        format.xlsx
      end 
    end  
  end

  def show
  end

  def new
    @paper = Paper.new
  end

  def edit
  end

  def create
    @paper = Paper.new(paper_params)
    @paper.save
    @paper.user_id = current_user.id
    @paper.save
    if @paper.save
      @paper.paper_number = "C15#{@paper.user_id}-#{@paper.id}"
      @paper.save
      # RegistrationMailer.registration_success(@registration).deliver_now
      # format.html { redirect_to papers_path, notice: 'Paper was successfully Uploaded.' }
      # format.json { render :show, status: :created, location: @paper }
    else
      format.html { render :new }
      format.json { render json: @registration.errors, status: :unprocessable_entity }
    end
    redirect_to papers_path 
  end

  def update
    @paper.update(paper_params)
    redirect_to papers_path 
  end

  def destroy
    @paper.destroy
    respond_with(@paper)
  end

  private
    def set_paper
      @paper = Paper.find(params[:id])
    end

    def paper_params
      params.require(:paper).permit(:type_of_conference, :paper_title, :abstract, :paper_version1, :paper_version2)
    end
end
