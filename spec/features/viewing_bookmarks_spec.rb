feature 'Viewing bookmarks' do
  scenario 'view the listed bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    
    bookmark = Bookmark.create(title: 'Makers Academy', url: "http://www.makersacademy.com")
    Bookmark.create(title: 'Destroy All Software', url: "http://www.destroyallsoftware.com")
    Bookmark.create(title: 'Google', url: "http://www.google.com")
    # we run the rest of the test as usual
    visit ('/bookmarks')

    expect(page).to have_link('Makers Academy', href: 'http://www.makersacademy.com')
    expect(page).to have_link('Destroy All Software',  href: 'http://www.destroyallsoftware.com')
    expect(page).to have_link('Google', href: 'http://www.google.com')
  end
end
