class Notifier < SendWithUsMailer::Base
    default from: 'no-reply@example.com'

    def payment_reminder_notification(item, member)
        assign(:account, member)

        # assign(:item_image, item.image.url)

        assign(:member_name, member.first_name)

        assign(:club_name, item.club.name)

        assign(:item_name, item.name)

        mail(
            email_id: ENV['EMAIL_ID'],
            recipient_address: member.email)
    end
end
