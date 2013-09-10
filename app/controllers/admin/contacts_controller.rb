class Admin::ContactsController < AdminController
  before_filter :load_contact, :except => :index

  def load_contact
    @contact = Contact.find(params[:id])
  end

  def index
    @contacts = Contact.all
    @contact = Contact.find(1)
  end

  def update
    if @contact.update_attributes(params[:contact])
      notice = "Contact updated."

      respond_to do |format|
        format.html do
          flash[:notice] = notice
          redirect_to admin_contacts_path
        end

      end
    end
  end
end