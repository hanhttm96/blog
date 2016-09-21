class ContactsController < InheritedResources::Base
	before_filter :authenticate

	  # GET /contacts/new
  def new
    @contact = Contact.new
  end
  # POST /contacts
  # POST /contacts.json
  def create
    @contact = Contact.new(contact_params)

    respond_to do |format|
      if @contact.save
        format.html { redirect_to root_path, notice: 'Contact was successfully sent.' }
        format.json { render :show, status: :created, location: @contact }
      else
        format.html { render :new }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end


  private

    def contact_params
      params.require(:contact).permit(:title, :content, :user_id)
    end
end

