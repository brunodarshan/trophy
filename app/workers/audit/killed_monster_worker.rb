# frozen_string_literal: true

module Audit
  class KilledMonsterWorker < WorkerBase
    def perform(user_id, monster_id)
      AfterKillMonster.new(user_id, monster_id).call
    end
  end
end
