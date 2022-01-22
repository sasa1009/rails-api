FactoryBot.define do
  sequence :slug do |i|
    "slug-#{i}"
  end

  factory :article do
    title { "Sample article" }
    content { "Sample content" }
    slug { generate :slug }
  end
end
