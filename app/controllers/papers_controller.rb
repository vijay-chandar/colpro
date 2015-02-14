class PapersController < ApplicationController
  before_action :set_paper, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  respond_to :html

  def index
    @papers = Paper.all
    respond_with(@papers)
  end

  def show
    respond_with(@paper)
  end

  def new
    @paper = Paper.new
    respond_with(@paper)
  end

  def edit
  end

  def create
    @paper = Paper.new(paper_params)
    @paper.save
    @paper.user_id = current_user.id
    @paper.save
    respond_with(@paper)
  end

  def update
    @paper.update(paper_params)
    respond_with(@paper)
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
