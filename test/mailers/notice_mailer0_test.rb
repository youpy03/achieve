require 'test_helper'

class NoticeMailer0Test < ActionMailer::TestCase
  test "sendmail_contact" do
    mail = NoticeMailer0.sendmail_contact
    assert_equal "Sendmail contact", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
