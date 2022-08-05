FactoryBot.define do
  factory :user do
    login { "MyString" }
    name { "MyString" }
    url { "MyString" }
    avatar_url { "MyString" }
    provider { "MyString" }
    # sequence(:login) { |n| "thi#{n}" }
    # name "baothi"
    # url "http://example.com"
    # avatar_url "http://example.com/avatar"
    # provider "github"
  end
end
