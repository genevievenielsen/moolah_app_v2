class Notifier < SendWithUsMailer::Base
    default from: 'no-reply@example.com'

    def payment_reminder_notification(item, email)
        assign(:account, email)

        # assign(:item_image, item.image.url)

        assign(:member_name, email.first_name)

        assign(:club_name, item.club.name)

        assign(:item_name, item.name)

        mail(
            email_id: ENV['EMAIL_ID'],
            recipient_address: email.email)
    end

    def imported_email_welcome(email, club)
        assign(:email_name, email.first_name)

        assign(:club_name, club.name)

        mail(
            email_id: ENV['MPORTED_EMAIL_ID'],
            recipient_address: email.email)
    end
end
