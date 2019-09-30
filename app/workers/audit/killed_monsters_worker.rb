# frozen_string_literal: true

module Audit
  class KilledMonsterWorker < WorkerBase
    def perform(user_id, monster_id)
      # count all monsters by id killed by user
      # and verify trophy
    end
  end
end
