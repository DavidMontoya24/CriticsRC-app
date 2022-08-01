class CriticsController < ApplicationController
  def create
    if params[:game_id]
      criticable = Game.find(params[:game_id])
    elsif params[:company_id]
      criticable = Company.find(params[:company_id])
    end

    @critic = current_user.critics.new(critic_params)
    authorize @critic
    # @critic = Critic.new(critic_params)
    @critic.criticable = criticable

    if @critic.save
      # redirect_to "/games/#{@critic.criticable.id}#element_critics", notice: "Critic was successfully create"
      redirect_to @critic.criticable, notice: "Critic was successfully create"
    else
      redirect_to criticable, status: :unprocessable_entity
    end
  end

  def update
    @critic = Critic.find(params[:id])
    authorize @critic
    @critic.update(approved: true)
    redirect_to @critic.criticable
  end

  def destroy
    @critic = Critic.find(params[:id])
    authorize @critic
    @critic.destroy
    redirect_to @critic.criticable, notice: "Critic was succesfully destroyed"
  end

  private

  def critic_params
    params.require(:critic).permit(:title, :body)
  end
end
