class Notifier < SendWithUsMailer::Base
    default from: 'no-reply@example.com'

    # add you have payed for an item

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

    def payment_confirmation(item, user)
        assign(:account, email)

        # assign(:item_image, item.image.url)

        assign(:first_name, email.first_name)

        assign(:club_name, item.club.name)

        assign(:item_name, item.name)

        assign(:item_price, item.price)

        assign(:item_description, item.description)

        mail(
            email_id: ENV['PAYMENT_EMAIL_ID'],
            recipient_address: email.email)
    end

    def imported_email_welcome(email, club)
        assign(:email_name, email.first_name)

        assign(:club_name, club.name)

        mail(
            email_id: ENV['IMPORTED_EMAIL_ID'],
            recipient_address: email.email)
    end

    def welcome_email(user)
        assign(:email_name, user.first_name)

        mail(
            email_id: ENV['WELCOME_EMAIL_ID'],
            recipient_address: user.email)
    end


end
