require 'rails_helper'

describe 'As a guest user' do
  context 'searching for the most dangerous day by a date range' do
    before(:each) do
      visit "/"
      fill_in :start_date, with: "2018-01-01"
      fill_in :end_date, with: "2018-01-07"
      click_on "Determine Most Dangerous Day"
    end

    it 'I am redirected to a page that specifies the most dangerous day' do
      expect(current_path).to eq("/most_dangerous_day")
      expect(page).to have_content("Most Dangerous Day")
      expect(page).to have_content("January 1, 2018 - January 7, 2018")
      expect(page).to have_content("Most dangerous day in specified range: January 1, 2018")
    # And I should see 3 asteroids in that list
    end

    it "I should see 3 asteroids listed for the most dangerous day" do
      expect(current_path).to eq("/most_dangerous_day")
      expect(page).to have_content("January 1, 2018 has 3 potentially dangerous near earth objects.")
    end

  end
end
