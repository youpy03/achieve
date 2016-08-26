class NoticeMailer0 < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer0.sendmail_contact.subject
  #
  def sendmail_contact(contact)

    @contact = contact

    mail to: @cotnact.email,
    	 content: "お問い合わせが完了しました"
  end
end
