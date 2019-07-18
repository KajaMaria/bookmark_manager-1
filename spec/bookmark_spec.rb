require 'database_helpers'

describe Bookmark do
  describe '.all' do
    it 'returns a list of bookmarks' do

      bookmark = Bookmark.create(url: 'http://www.makersacademy.com', title: 'makers')
      Bookmark.create(url: 'http://www.destroyallsoftware.com', title: 'destroy')
      Bookmark.create(url: 'http://www.google.com', title: 'google')

      bookmarks = Bookmark.all

      expect(bookmarks.length).to eq 3
      expect(bookmarks[0]).to be_a Bookmark
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq 'makers'
      expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
    end
  end
  describe '.create' do
    it 'creates a new bookmark' do
      bookmark = Bookmark.create(url: 'http://www.testbookmark.com', title: 'Test Bookmark')
      persisted_data = persisted_data(id: bookmark.id)

      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data['id']
      expect(bookmark.title).to eq 'Test Bookmark'
      expect(bookmark.url).to eq 'http://www.testbookmark.com'
    end
  end
  describe '.delete' do
    it 'deletes bookmarks' do
      bookmark = Bookmark.create(title: 'Google', url: 'http://www.google.com')

      Bookmark.delete(id: bookmark.id)

      expect(Bookmark.all.length).to eq 0
    end
  end
end
