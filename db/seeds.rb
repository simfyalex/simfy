# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require "factory_girl"
require File.join(Rails.root, 'spec', 'support', 'factories')

User.delete_all
Album.delete_all
Artist.delete_all
Track.delete_all
FactoryGirl.create(:user,:username=>'john',:email=>'john@example.com')
FactoryGirl.create(:user,:username=>'petter',:email=>'petter@example.com')
