# frozen_string_literal: true

class DeathProcessService
  def initialize(user_id)
    @user = User.find(user_id)
    @all_deaths = Death.where(user_id: user_id).size
  end

  def call
    resolve_death_trophy_levels
 end

  private

  def resolve_death_trophy_levels
    if @all_deaths > 0
      deaths = [1, 10, 25, 50, 100]
      deaths.each_index do |index|
        unless index + 1 == deaths.length
          @user.death_trophies.find_or_create_by(quantity: deaths[index]) if @all_deaths >= deaths[index]
        end
      end
    end
  end
end
