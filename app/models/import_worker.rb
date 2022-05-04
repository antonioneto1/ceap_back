class ImportWorker
  include Sidekiq::Worker

  def perform(ceap_id)
    ceape = Ceap.find(ceap_id)
  end
end