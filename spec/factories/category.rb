FactoryBot.define do
  factory :category, class: Category do
    trait :fashion do
      name { 'Fashion' }
    end

    trait :magazine do
      name { 'Magazine' }
    end

    trait :priority_2 do
      priority { 2 }
    end

    trait :priority_1 do
      priority { 1 }
    end
  end
end
