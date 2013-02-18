ActionMailer::Base.smtp_settings = {
	:address => "smtp.gmail.com",
	:port => 587 ,
	:domain => "playedby.me",
	:user_name => "team@playedby.me",
	:password => "!PBM@2013",
	:authentication => "plain",
	:enable_starttls_auto => true
}