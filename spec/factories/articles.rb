FactoryBot.define do
  factory :article do
    sequence(:title) { |n| "Sample article #{n}" }
    sequence(:content) { |n| "The content of my awesome article #{n}" }
    sequence(:slug) { |n| "sample-article-#{n}" }
    association :user
  end
end