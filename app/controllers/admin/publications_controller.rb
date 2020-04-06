class Admin::PublicationsController < AdminController
  before_action :find_publication, only: %i[show edit update destroy]

  def index
    @publications = Publication.all
  end

  def show; end

  def new
    @publication = Publication.new
  end

  def create
    @publication = Publication.new(publication_params)

    if @publication.save
      redirect_to admin_publication_path(@publication), notice: "Successfully created publication."
    else
      render  :new, flash[:error] =  "Something went wrong."
    end
  end

  def edit; end

  def update
    if @publication.update(publication_params)
      redirect_to admin_publication_path(@publication), notice: "Successfully edited publication."
    else
      redirect_to edit, flash[:error] =  "Something went wrong."
    end
  end

  def destroy
    if @publication.delete
      flash[:notice] = 'Publication deleted!'
      redirect_to admin_publications_path
    else
      flash[:error] = 'Failed to delete this publication!'
      render :destroy
    end
  end

  private

  def find_publication
    @publication = Publication.find_by_id(params[:id])
  end

  def publication_params
    params.require(:publication).permit(:title, :description, :file_url)
  end
end