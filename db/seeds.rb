if Rails.env.development?
  amount = 15
  puts "creating users...".colorize(:green)
  
  amount.times do |i|
    # name         =  "user #{id.humanize}".titleize
    def name         = Faker::Name.name
    def phone_number = Faker::PhoneNumber.cell_phone
    def email        = "user#{User.last&.id || 0 + 1}@example.com"
    def password     = 123456

    def attrs = { name: name, email: email, password: password, phone_number: phone_number }
    user = User.new attrs

    if user.invalid?
      _attrs = attrs.dup
      _attrs.merge!(email: user.email.prepend(Faker::Alphanumeric.alphanumeric)) if user.errors.to_hash.has_key?(:email)

      user.assign_attributes _attrs
    end

    user.save!
    puts "created user #{i + 1}/#{amount}".colorize(:green)
    puts JSON.pretty_generate( user.attributes.slice(*attrs.as_json.keys) ).colorize(:blue)
  end

  amount = rand(50..150)
  puts "creating posts...".colorize(:green)

  amount.times do |i|
    def title(title = nil)        = (title ||= (Faker::Boolean.boolean ? Faker::Quote.famous_last_words : Faker::Books::CultureSeries.book))
    def user_id                   = User.all.sample.id
    def body(number: rand(3..10)) = ( 
      def boolean = Faker::Boolean.boolean; return Faker::Lorem.sentences(number: number).join if boolean; 
      return (boolean ? Faker::Quote.famous_last_words : Faker::Books::CultureSeries.book) if boolean
      boolean ? Faker::TvShows::AquaTeenHungerForce.quote : Faker::TvShows::RickAndMorty.quote
    )

    def attrs = { title: title, body: body, user_id: user_id }
    post = Post.create! attrs

    puts "created post #{i + 1}/#{amount}".colorize(:green)
    puts JSON.pretty_generate( post.attributes.as_json ).colorize(:blue)
  end
end
