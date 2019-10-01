# frozen_string_literal: true

module Audit
  class CoinsWorker < WorkerBase
    def perform(user_id)
      CoinsTrophyService.new.call(user_id)
    end
  end
end
