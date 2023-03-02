ActionMailer::Base.smtp_settings = {
  address: "smtp.gmail.com",
  port: 587,
  domain: 'gmail.com',
  user_name: ENV['florian.calabrese@gmail.com'],
  password: ENV['feynvjegonvyxrng'],
  authentication: :login,
  enable_starttls_auto: true
}
