# frozen_string_literal: true

require 'spec_helper'

describe 'The Page renders', type: :feature, js: true do
  before :each do
    visit '/'
  end

  it 'has a page title' do
    expect(page).to have_content('A Community of Aspiring & Experienced Ruby Developers in Belfast')
  end

  it 'has a header' do
    expect(page).to have_selector('header')
  end

  it 'has a footer' do
    expect(page).to have_selector('footer')
  end

  it 'has a logo' do
    expect(page).to have_selector('.logo')
  end

  it 'has a navigation bar' do
    expect(page).to have_selector('nav')
  end
end
