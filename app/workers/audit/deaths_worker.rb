# frozen_string_literal: true

module Audit
  class DeathsWorker < WorkerBase
    def perform(user_id) 
      DeathProcessService.new(user_id).call
    end
  end
end
