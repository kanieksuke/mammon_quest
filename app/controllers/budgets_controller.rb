class BudgetsController < ApplicationController
  def new
    @budget = Budget.new
  end

  def create
    @budget = Budget.new(budget_params)
    attack_calculation
    @budget.resist = 0
    @budget.save
    redirect_to targets_path(@budget.id)
  end

  private
  def budget_params
    params.require(:budget).permit(:attack_base, :resist_base).merge(target_id: current_user.id)
  end

  def attack_calculation
    d = Date.new(Time.now.year, Time.now.month, -1).day
    @budget.attack = (@budget.attack_base - @budget.resist_base) / d
  end
end
