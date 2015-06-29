class LinksController < ApplicationController
  before_action :set_link, only: [:show, :edit, :update, :destroy]

  def index
    @links = Link.all
  end

  def show
    if params[:slug]
      @link = Link.find_by(slug: params[:slug])
    else
      @link = Link.find(params[:id])
    end

    def create
      @link = Link.new(link_params)

      respond_to do |format|
        if @link.save
          format.html { redirect_to @link, notice: 'Link was successfully created.' }
          format.json { render :show, status: :created, location: @link }
        else
          format.html { render :new }
          format.json { render json: @link.errors, status: :unprocessable_entity }
        end
      end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_link
      @link = Link.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def link_params
      params.require(:link).permit(:url, :slug, :clicks, :snapshot, :title)
    end
  end
end
