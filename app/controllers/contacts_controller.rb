class ContactsController < ApplicationController
    def new
        @contact = Contact.new
    end
    
    def create
        @contact = Contact.create(contact_params)
        if @contact.save
            redirect_to new_contact_path, notice: "Your Message has been sent."
        else
            redirect_to new_contact_path, notice: "Error occured."
        end
    end
    
    private 
        def contact_params
            params.require(:contact).permit(:name, :email, :comments)
        end
end