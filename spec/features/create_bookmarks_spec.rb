feature 'Adding Bookmarks' do
  scenario 'add to the list of bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    visit('/bookmarks')
    fill_in 'url', with: 'http://www.thisisatest.com'
    click_button 'Add Bookmark!'
    expect(page).to have_content "http://www.thisisatest.com"
  end
end
