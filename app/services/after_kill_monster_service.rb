# frozen_string_literal: true

class AfterKillMonsterService
  def initialize(user_id, monster_id)
    @user = User.find(user_id)
    @killeds_monster_count = @user.killed_monsters.where(monster_id: monster_id).size
  end

  def call
    process_killed_monster
  end

  private

  def process_killed_monster
    if @killeds_monster_count > 0
      deaths = [1, 100, 1000, 10_000, 100_000]
      deaths.each_index do |index|
        unless index + 1 == deaths.length
          @user.killed_monster_trophies.find_or_create_by(quantity: deaths[index]) if @killeds_monster_count >= deaths[index]
        end
      end
    end
  end
end
