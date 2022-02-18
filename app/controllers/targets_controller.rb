class TargetsController < ApplicationController
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
    redirect_to new_target_budget_path(@target.id)
  end

  private
  def target_params
    params.require(:target).permit(:max_hp, :max_mp).merge(user_id: current_user.id)
  end
end
