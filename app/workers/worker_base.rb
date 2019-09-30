class WorkerBase
    include Sidekiq::Worker
    def perform
        raise 'should override method'
    end
end