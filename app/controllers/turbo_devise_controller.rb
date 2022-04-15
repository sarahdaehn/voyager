#this code is from Github Issues solving the Bug of NoMethodError in Devise::RegistrationsController#create undefined method `user_url' for #<Devise::RegistrationsController:0x0000000000e088>
# responds with html & turbo instat of just html 


class TurboDeviseController < ApplicationController
    class Responder < ActionController::Responder
        def to_turbo_stream
            controller.render(options.merge(formats: :html))
        rescue ActionView::MissingTemplate => e 
            if get?
                raise e
            elsif has_errors? && default_action   
                render rendering_options.merge(formats: :html, status: :unprocessable_entity)
            else
                redirect_to navigation_location
            end
        end
    end 

    self.responder = Responder 
    respond_to :html, :turbo_stream
end