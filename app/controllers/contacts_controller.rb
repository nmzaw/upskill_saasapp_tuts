class ContactsController < ApplicationController
    def new
        @contact = Contact.new
    end
    
    def create
        @contact = Contact.create(contact_params)
        if @contact.save
            flash[:success] = "Your message has been sent."
            redirect_to new_contact_path
        else
            flash[:danger] = @contact.errors.full_messages.join(", ")
            redirect_to new_contact_path
        end
    end
    
    private 
        def contact_params
            params.require(:contact).permit(:name, :email, :comments)
        end
end