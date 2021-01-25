FactoryBot.define do
    factory :book do
      title { 'A Fake Title' } 
      genre { 'Drama' }
      isbn_number { '1-11111-111-1' }
      publish_date { 10.years.ago }
    end
  end