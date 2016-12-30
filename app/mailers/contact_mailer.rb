class ContactMailer < ActionMailer::Base
    default to: 'pico83@gmail.com'
    def contact_email(name,email,body)
        @name = name
        @email = email
        @body = body
        mail(from: email, subject: "Contact from Message : UpSkillCourse RoR Tutorial")
    end
end