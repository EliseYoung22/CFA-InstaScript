class MedicationsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]
  before_action :set_medication, only: [:show, :edit, :update, :destroy]

  # GET /medications
  # GET /medications.json
  def index
    @medications = Medication.all.where(availability:true)
    @medications = Medication.where(nil)
    filtering_params(params).each do |key, value|
      @medications = @medications.public_send(key, value) if value.present?
    end
end
  

  # GET /medications/1
  # GET /medications/1.json
  def show
  end

  # GET /medications/new
  def new
    @medication = Medication.new
  end

  # GET /medications/1/edit
  def edit
    authorize! :manage, @medication
  end

  # POST /medications
  # POST /medications.json
  def create
    @medication = current_user.medications.new(medication_params)

    respond_to do |format|
      if @medication.save
        format.html { redirect_to @medication, notice: 'Medication was successfully created.' }
        format.json { render :show, status: :created, location: @medication }
      else
        format.html { render :new }
        format.json { render json: @medication.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /medications/1
  # PATCH/PUT /medications/1.json
  def update
    authorize! :manage, @medication
    respond_to do |format|
      if @medication.update(medication_params)
        format.html { redirect_to @medication, notice: 'Medication was successfully updated.' }
        format.json { render :show, status: :ok, location: @medication }
      else
        format.html { render :edit }
        format.json { render json: @medication.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medications/1
  # DELETE /medications/1.json
  def destroy
    authorize! :manage, @medication
    @medication.destroy
    respond_to do |format|
      format.html { redirect_to medications_url, notice: 'Medication was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_medication
      @medication = Medication.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def medication_params
      params.require(:medication).permit(:name, :manufacturer, :description, :price, :availability, :image, :resource)
    end

    def filtering_params(params)
      params.slice(:medication, :description, :price)
    end
end
