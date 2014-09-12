require 'rails-helper'

describe "Sign in flow" do
	
	include TestFactories

	describe "successful" do
		it "redirects to the topics index" do
			use = authenticated_user
			visit root_path

			within '.user-info' do
				click_link 'Sign in'
			end
			fill_in 'Email', with: user.email
			fill_in 'Password', with: user.password
		
			within 'form' do
				click_button 'Sign in'
			end

			expect(current_path).to eq topics_path
		end
	end
end