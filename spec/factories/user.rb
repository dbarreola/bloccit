FactoryGirl.define do
	
	factory :user do
		name "Douglas Adams"
		sequence(:email, 100) {|n| "Person#{n}@example.com"}
		password "helloworld"
		password_confirmation "helloworld"
		confirmed_at Time.now
	end

end