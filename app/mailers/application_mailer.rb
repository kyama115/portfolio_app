# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: "chill.shisha.web@gmail.com"
  layout "mailer"
end
