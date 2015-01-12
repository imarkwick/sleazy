require 'rails_helper'
require_relative './helper.rb'

feature 'user' do 




	context 'user not signed in and on the home page' do

		scenario 'should see sign in and sign up link' do
			visit '/'
			expect(page).to have_link 'up'
			expect(page).to have_link 'in'
		end

		scenario 'should not see sign out link' do
			visit '/'
			expect(page).not_to have_link 'out'
		end
	end

	context 'user signed in on the homepage' do

		scenario 'should see sign out link', :js => true do
			visit '/'
		  click_link 'up'
		  puts current_path
		  fill_in 'Email', with: 'test@example.com'
		  fill_in 'Password', with: 'testtest'
		  fill_in 'Password confirmation', with:'testtest'
		  # expect(page).to hav/ e_button 'Sign up'
		  keypress = "document.getElementById('new_user').submit();"
		  page.driver.browser.execute_script(keypress)
			# visit('/tracks')
			expect(current_path).to eq '/'
			# page.evaluate_script("var e = $.Event('keypress', { keyCode: 13 }); $('body').trigger(e)")
			# save_and_open_page
			# click_button 'Sign up'
			expect(page).to have_content 'out'
		end

		# scenario 'should not see a sign in and sign up link' do
		# 	visit '/'
		# 	expect(page).not_to have_link 'in'
		# 	expect(page).not_to have_link 'up'
		# end
	end


end

# describe "Something" do
#   it "uses javascript", :js => true do
#      pending "write a test"
#   end
# end







