# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    title { 'Title' }
    body { 'This is the test body from the Post :)' }
  end
end
