feature 'Updating Bookmarks' do
  scenario 'update a bookmark in the list' do
    bookmark = Bookmark.create(title: 'Testy McTest', url: 'www.testymctest.com')
    visit ('/bookmarks')
    expect(page).to have_link('Testy McTest', href: 'www.testymctest.com')

    first('.bookmark').click_button 'Edit'
    expect(current_path).to eq "/bookmarks/#{bookmark.id}/edit"

    fill_in 'title', with: 'New Testy McTest'
    fill_in 'url', with: 'www.newtestymctest.com'
    click_button 'Save'

    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link('Testy McTest', href: 'www.testymctest.com')
    expect(page).to have_link('New Testy McTest', href: 'www.newtestymctest.com')
  end
end
