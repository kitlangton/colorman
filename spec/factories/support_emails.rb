FactoryGirl.define do
  factory :support_email do
    subject "Request support from Steven Fraser (kit.langton+steven@gmail.com)  on login issues"
    body "phone: 5626776786username: s1frastCannot login"

    trait :general_feedback do
      subject "Request support from Brittney (Brittney.stapleton@vzw.com)  user 'D32109' from the West area on general feedback"
      body "Can we please get an accessory COC that has the jbl flip 2 with the new price (99.99) and the clip and pulse still on it?"
    end
  end
end
