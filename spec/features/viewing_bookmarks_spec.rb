feature 'Viewing bookmarks' do
  scenario 'view the listed bookmarks' do
    # we connect to the TEST databases
    connection = PG.connect(dbname: 'bookmark_manager_test')
    # we add the test data
    connection.exec("INSERT INTO bookmarks VALUES(1, 'http://www.makersacademy.com');")
    connection.exec("INSERT INTO bookmarks VALUES(2, 'http://www.destroyallsoftware.com');")
    connection.exec("INSERT INTO bookmarks VALUES(3, 'http://www.google.com');")
    # we run the rest of the test as usual
    visit ('/bookmarks')
    expect(page).to have_content "http://www.makersacademy.com"
    expect(page).to have_content "http://www.google.com"
    expect(page).to have_content "http://www.destroyallsoftware.com"
  end
end
