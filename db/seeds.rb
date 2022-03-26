if Rails.env.development?
  users_to_create = 10

  starting_id_to_create = User.last ? ( User.last.id + 1) : 1
  ending_id_to_create = starting_id_to_create + users_to_create

  (starting_id_to_create..ending_id_to_create).each do |id|
    user = User.new(
        id: id,
        first_name: 'User',
        last_name: "#{id.humanize.capitalize}",
        phone_number: "954"+[*0..3, *0..4].sample(7).join,
        email: "user#{id}@gmail.com",
        password: '123456',
        password_confirmation: "123456"
    )
    user.save
  end


  rand(33..99).times do
    rand_title = [
      Faker::Quote.famous_last_words,
      Faker::Books::CultureSeries.book,
    ].sample

    rand_body = [
      Faker::Lorem.paragraphs(number: rand(3..13)).join(" "),
      Faker::Lorem.sentences(number: rand(8..25)).join(" "),
      Faker::TvShows::AquaTeenHungerForce.quote,
      Faker::TvShows::RickAndMorty.quote
    ].sample

    rand_user_id = rand(1..10)

    post = Post.create(title: rand_title, body: rand_body, user_id: rand_user_id)
  end
end
