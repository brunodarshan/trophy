# frozen_string_literal: true

class MonstersController < ApplicationController
  

  def destroy
    @killed_monster = KilledMonster.new(killed_monster_params)
    if @killed_monster.save
      @user = User.find(killed_monster_params[:user_id])
      @monster = Monster.find(killed_monster_params[:monster_id])
      render json: {
        msg: :success, data: "#{@user.username} killed #{@monster.name}"
      }
        # TO DO process data and verify if has trophy
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
