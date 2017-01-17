class PagesController < ApplicationController
    # Home page
    def home
        @basic_plan = Plan.find(1)
        @pro_plan = Plan.find(2)
    end
    
    #About page
    def about
    end
end