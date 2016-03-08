class LetterMailer < BaseMandrillMailer

  def testing
    subject = "Welcome to our awesome app!"
    merge_vars = {
      "FIRST_NAME" => "User"
    }
    body = mandrill_template("testing", merge_vars)

    send_mail(User.last.email, subject, body)
  end

end