class StatusCeapMailer < ApplicationMailer

  def conclusao_ceap(email, erros)
    attachments.inline['email.png'] - File.read("#{Rails.root}/app/assents/imagens/email.png")
    @email = email
    @erros = erros
    mail(to: @email, subject: 'Seu Arquivo está Pronto')
  end
end
