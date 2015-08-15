class ContactsController < ApplicationController
    def new
        @contact = Contact.new 
    end
    
    def create
        @contact = Contact.new(contact_params)
        
        if @contact.save
            flash[:success] = "Great! You sent a message :)"
            redirect_to new_contact_path
        else
            flash[:error] = "Uh oh, your message did NOT send :("            
            redirect_to new_contact_path
        end
    end
    
    private
        def contact_params
            params.require(:contact).permit(:name, :email, :comments)
        end
    
end