class ConclusaoJob < ApplicationJob
  queue_as :mailers

  def perform(email, errors)
    StatusCeapMailer.conclusao_ceap(email, errors).deliver_now
  end
end
