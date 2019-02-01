require 'database_helper'

RSpec.describe 'Bookmark' do

  describe '.all' do
    it 'should show the list of bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      #adding test data
      bookmark = Bookmark.create(url: "http://www.makersacademy.com", title: 'Makers Academy')
      Bookmark.create(url: "http://www.destroyallsoftware.com", title: 'Destroy All Software')
      Bookmark.create(url: "http://www.google.com", title: 'Google')

      bookmarks = Bookmark.all

      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq 'Makers Academy'
      expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
    end
  end

  describe '.create' do
    it 'should create a new bookmark' do
      bookmark = Bookmark.create(title: 'Test Site', url: 'www.thisisatest.com')
      persisted_data = persisted_data(id: bookmark.id)

      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data(id: bookmark.id)['id']
      expect(bookmark.title).to eq 'Test Site'
      expect(bookmark.url).to eq 'www.thisisatest.com'
    end
  end
end
