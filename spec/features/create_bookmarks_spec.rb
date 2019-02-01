feature 'Adding Bookmarks' do
  scenario 'add to the list of bookmarks' do
    visit('/bookmarks')
    fill_in 'title', with: 'Test Site'
    fill_in 'url', with: 'http://www.thisisatest.com'
    click_button 'Add Bookmark!'
    expect(page).to have_link('Test Site', href: 'http://www.thisisatest.com')
  end
end
