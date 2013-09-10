class Admin::BiosController < AdminController
  before_filter :load_bio, :except => :index

  def load_bio
    @bio = Bio.find(params[:id])
  end

  def index
    @bios = Bio.all
    @bio = Bio.find(1)
  end

  def update
    if @bio.update_attributes(params[:bio])
      notice = "Bio updated."

      respond_to do |format|
        format.html do
          flash[:notice] = notice
          redirect_to admin_bios_path
        end

      end
    end
  end
end