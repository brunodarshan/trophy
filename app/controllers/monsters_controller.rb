# frozen_string_literal: true

class MonstersController < ApplicationController
  def destroy
    @killed_monster = KilledMonster.new(killed_monster_params)
    if @killed_monster.save
      @user = User.find(killed_monster_params[:user_id])
      @monster = Monster.find(killed_monster_params[:monster_id])
      Audit::KilledMonsterWorker.perform_async(@user.id, @monster.id)
      render json: {
        msg: :success, data: "#{@user.username} killed #{@monster.name}"
      }
    else
      render json: {
        msg: :error, data: @killed_monster.errors
      }, status: :unauthorized
    end
  end

  private

  def killed_monster_params
    params.permit(:user_id, :monster_id)
  end
end
