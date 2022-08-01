class InvolvedCompaniesController < ApplicationController
  before_action :set_game, only: %i[add_developer add_publisher remove_developer remove_publisher]

  def add_developer
    authorize @game, :update?
    @company = Company.find_by(id: params[:company_id])
    involved_company = InvolvedCompany.find_by(game: @game, company: @company)
    if involved_company.nil?
      @game.involved_companies.create(company: @company, developer: true, publisher: false)
    else
      involved_company.update(developer: true)
    end
    redirect_to game_path(@game)
  end

  def add_publisher
    authorize @game, :update?
    @company = Company.find_by(id: params[:company_id])
    involved_company = InvolvedCompany.find_by(game: @game, company: @company)
    if involved_company.nil?
      @game.involved_companies.create(company: @company, developer: false, publisher: true)
    else
      involved_company.update(publisher: true)
    end
    redirect_to game_path(@game)
  end

  def remove_developer
    authorize @game, :update?
    involved_company = InvolvedCompany.find(params[:ic_id])
    involved_company.update(developer: false)
    involved_company.delete unless involved_company.developer || involved_company.publisher
    redirect_to game_path(@game), status: :see_other
  end

  def remove_publisher
    authorize @game, :update?
    involved_company = InvolvedCompany.find(params[:ic_id])
    involved_company.update(publisher: false)
    involved_company.delete unless involved_company.developer || involved_company.publisher
    redirect_to game_path(@game), status: :see_other
  end

  private

  def set_game
    @game = Game.find(params[:id])
  end
end
