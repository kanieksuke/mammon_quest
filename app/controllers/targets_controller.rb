class TargetsController < ApplicationController
  before_action :move_to_new
  def index
  end

  def new
    @target = Target.new
  end

  def create
    @target = Target.new(target_params)
    @target.current_hp = @target.max_hp
    @target.current_mp = 0
    @target.save
    redirect_to new_target_budgets_path(@target)
  end

  def destroy
    target = Target.find(params[:id])
    target.destroy
    redirect_to new_target_path
  end

  private
  def target_params
    params.require(:target).permit(:max_hp, :max_mp).merge(user_id: current_user.id)
  end

  def move_to_new
    if @target == nil
      render action: :new
    end
  end
end
