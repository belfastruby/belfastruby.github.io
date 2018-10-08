# frozen_string_literal: true

require 'spec_helper'

describe 'The resources page renders as expected', type: :feature, js: true do
  before :each do
    visit '/resources'
  end

  it 'Has the correct Heading' do
    expect(page).to have_selector('h1', text: 'Resources', exact_text: true)
  end

  it 'Has a resources-page section with the correct nested elements ' do
    expect(page).to have_selector('.resources-page')
    within('.resources-page') do
      expect(page).to have_selector('.ruby-links', count: 3)
      expect(page).to have_selector('h2', count: 3)
    end
  end

  it 'Has a footer with the correct nested elements' do
    expect(page).to have_selector('footer')
    within('footer') do
      expect(page).to have_selector('.bio')
      expect(page).to have_selector('.contact')
    end
  end
end
