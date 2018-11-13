require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe "account_activation" do
    let(:mail) { UserMailer.account_activation(bob) }
    let(:bob) { create(:user)}

    it "renders the headers" do
      expect(mail.subject).to eq("Account activation")
      expect(mail.to).to eq([bob.email])
      expect(mail.from).to eq(["noreply@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Salutations")
      expect(mail.body.encoded).to match(bob.name)
    end
  end

  describe "password_reset" do
    let(:bob) { create(:user, reset_token: User.new_token, reset_sent_at: Time.zone.now)}
    let(:mail) { UserMailer.password_reset(bob) }

    it "renders the headers" do
      expect(mail.subject).to eq("Password reset")
      expect(mail.to).to eq([bob.email])
      expect(mail.from).to eq(["noreply@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Password reset")
      expect(mail.body.encoded).to match("To reset your password click the link below:")
    end
  end

end
