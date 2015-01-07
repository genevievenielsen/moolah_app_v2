task :check_payments => :environment do
  @required_items = Item.where(:required => true)

  #users
  @required_items.each do |item|
    item.club.members.each do |member|
      if member.paid_items.include?(item)
        # puts "you have your shit together"
      else
        # puts "you #{member.email} are annoying because you still need to pay for #{item.name}"
        Notifier.payment_reminder_notification(item, member).deliver
      end
    end
  end

  #emails
  @required_items.all.each do |item|
     #all people on the email list who have not register
    item.club.emails.each do |email| unless item.club.members.pluck(:email).include?(email.email)
      # puts "you #{email.email} need to register"
      Notifier.payment_reminder_notification(item, member).deliver
    end
  end

  end
end
