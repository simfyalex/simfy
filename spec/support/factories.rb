require "faker"


FactoryGirl.define do
  factory :user do |user|
    sequence(:username) { |n| "user#{n}" }
    email Faker::Internet.email
    password 'password'
    password_confirmation 'password'
    user.artists {|artists| [artists.association(:artist)]}
  end

  factory :artist do  |artist|
    name Faker::Name.name
    biography Faker::Lorem.paragraphs
    artist.albums {|albums| [albums.association(:album)]}
  end


  factory :album do |album|
    label Faker::Name.name
    review  Faker::Lorem.paragraphs
    sequence( :release_at ) {|n| rand(10.years) }
    album.tracks {|tracks| [tracks.association(:track)]}
  end

  factory :track do
    title Faker::Name.name
    duration "00:56"
  end
  factory :comment do
    body  Faker::Lorem.paragraphs
  end
end

