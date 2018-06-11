class RegistrationsController < Devise::RegistrationsController
  def create
    build_resource(sign_up_params)

    resource.class.transaction do
      resource.save
      yield resource if block_given?
      if resource.persisted?
        @payment = Payment.new({email: params["user"]["email"], token: params[:payment]["token"],
        user_id: resource.id})

        flash[:error] = "Please check registration errors" unless @payment.valid?

        begin
          @payment.process_payment
          @payment.save
        rescue Exception => e
          flash[:error] = e.message

          resource.destroy
          puts 'Payment failed'
          render :new and return
        end

    end
  end


  protected

  def configure_permitted_parameters
    devise_paramater_sanitizer.for(:sign_up).push(:payment)
  end



end