# frozen_string_literal: true

module Audit
  class CoinsWorker < WorkerBase
    def perform(user_id)
      # Count colleted coins by user and
      # verify if has trophy to quantity collected
    end
  end
end
