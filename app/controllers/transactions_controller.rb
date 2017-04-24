class TransactionsController < ApplicationController

  def create
    medication = Medication.find_by!(slug: params[:slug])
    token = params[:stripeToken]

    begin  
     charge = Stripe::Charge.create(
      amount: medication.price,
      currency: "usd",
      card: token,
      description: current_user.email
      )

      @sale = medication.sales.create!(buyer_email: current_user.email)
        redirect_to pickup_url(uuid: @sale.uuid)

      rescue Stripe::CardError => e
    flash[:notice] = e.message
    redirect_to medication_path(medication)
    end
  end

  def pickup
    @sale = Sale.find_by!(uuid: params[:uuid])
    @medication = @sale.medication
  end

end