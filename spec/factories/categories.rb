FactoryBot.define do
  factory :purchase do
    name { 'Example Purchase' }
    amount { 100.0 }
    author { association(:user) } # Assuming user factory is defined
    categories { [association(:category)] } # Assuming category factory is defined
  end
end
