task :check_payments => :environment do
  @required_items = Item.where(:required => true)

  @required_items.each do |item|
    item.club.members.each do |member|
      if member.paid_items.include?(item)
        puts "you have your shit together"
      else
        # puts "you are an annoying nimrod because you still need to pay for #{item.name}"

        Notifier.payment_reminder_notification(item, member).deliver
      end
    end
  end
end
