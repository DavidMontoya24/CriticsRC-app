class CompaniesController < ApplicationController
  before_action :set_company, only: %i[show edit update destroy]

  # GET /companies
  def index
    @companies = Company.all
  end

  # GET /companies/1
  def show
    authorize @company
    all_critics = policy_scope(Critic)
    received_critics = @company.received_critics
    @company_critics = all_critics & received_critics
  end

  # GET /companies/new
  def new
    @company = Company.new
    authorize @company
  end

  # GET /companies/1/edit
  def edit
    authorize @company
  end

  # POST /companies
  def create
    @company = Company.new(company_params)
    authorize @company

    if @company.save
      redirect_to companies_path, notice: "Company was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /companies/1
  def update
    authorize @company
    if @company.update(company_params)
      redirect_to companies_path, notice: "Company was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /companies/1
  def destroy
    authorize @company
    @company.destroy
    redirect_to companies_url, notice: "Company was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_company
    @company = Company.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def company_params
    params.require(:company).permit(:name, :description, :start_date, :country, :cover)
  end
end
