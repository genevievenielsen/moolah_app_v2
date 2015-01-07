task :check_emails => :environment do
 @required_items = Item.where(:required => true)

 @required_items = Item.where(:required => true).all.each do |item|
     #all people on the email list who have not register
    item.club.emails do |email|
      puts "you need to register"

    end
  end

end
