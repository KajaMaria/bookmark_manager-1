# As a user
# So I can remove my bookmark from Bookmark Manager
# I want to delete a bookmark
feature 'Deleting bookmarks' do
  scenario 'A user is able ot delete bookmarks' do
    Bookmark.create(url: 'http://www.google.com', title:'Google')
    visit('/bookmarks')
    expect(page).to have_link('Google', href: 'http://www.google.com')

    first('.bookmark').click_button 'Delete'

    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link('Google', href: 'http://www.google.com')
  end
end
