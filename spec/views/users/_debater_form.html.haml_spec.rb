require 'spec_helper'

describe 'users/_debater_form' do
	it 'should contain pre filled information about the team and speaker number' do	
		debater = FactoryGirl.create(:debater)
		form_for(debater, url: '/users/debaters', html: { class: 'form-horizontal edit_debaters' } ) do |f| 
			@f = f 
		end	
		render 'debater_form', debater: debater, f: @f 
		rendered.should have_field 'Name'
		rendered.should have_field 'Male'
		rendered.should have_field 'Female'
		rendered.should have_field 'Email'
		
	end

end