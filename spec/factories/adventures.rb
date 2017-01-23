FactoryGirl.define do
  factory :adventure do
    date_time { Date.today.strftime("%A, %B %d %I:%M %P") }
    activity { FFaker::Sport.name }
    location { FFaker::AddressUS.neighborhood }
    description { FFaker::HipsterIpsum.words(4).join(',') }
  end
end
