RSpec.describe 'Bookmark' do

  describe '.all' do
    it 'should show the list of bookmarks' do
      bookmarks = Bookmark.all
      expect(bookmarks).to include "http://www.makersacademy.com"
      expect(bookmarks).to include "http://www.google.com"
      expect(bookmarks).to include "http://www.destroyallsoftware.com"
    end
  end
end
