feature 'Viewing bookmarks' do
  scenario 'view the listed bookmarks' do
    visit ('/bookmarks')
    expect(page).to have_content "http://www.google.com"
    expect(page).to have_content "http://www.facebook.com"
    expect(page).to have_content "http://www.youtube.com"
  end
end
