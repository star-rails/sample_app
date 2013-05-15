require 'spec_helper'
require 'capybara/rspec'

describe "Statics" do

  describe "Home page" do

    it "should have the content " do
      visit '/statics/home'
      page.should have_content('Hello')
    end
  end


  describe "Help page" do

  	it "should have the content" do
  		visit '/statics/help'
  		page.should have_content('Help')
  	end
  end

  describe "Abour page" do

   it "should have the content" do
   	  visit '/statics/about'
   	  page.should have_content('About')
    end  
  end


end
