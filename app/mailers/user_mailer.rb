class UserMailer < ActionMailer::Base
  default from: "shrlyai.sa@gmail.com"

  def party_email(party_profile)
  	#if @user.email = false
  	@party_profile=party_profile
  	@user=User.where("id = ?", @party_profile.host).first
  	mail(:to => @user.email, :subject => "Thanks for using PlayedBy.me! Get your party started")
  end
end
