class TransactionsController < ApplicationController

  def create
    medication = Medication.find_by!(slug: params[:slug])
    sale = medication.sales.create(amount: medication.price, 
      buyer_email: current_user.email,
      seller_email: medication.user.email,
      stripe_token: params[:stripeToken])
    sale.process!

    if sale.finished?
        redirect_to pickup_url(uuid: sale.uuid)
    else
      redirect_to medication_path(medication), notice: e.message
    end
  end

  def pickup
    @sale = Sale.find_by!(uuid: params[:uuid])
    @medication = @sale.medication
  end

end