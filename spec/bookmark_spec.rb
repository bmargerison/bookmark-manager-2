require './lib/bookmark.rb'
require 'pg'

describe Bookmark do 
	it 'returns the list of all bookmarks' do
		connection = PG.connect(dbname: 'bookmark_manager_test')

		# Add the test data
		bookmark = Bookmark.add("http://www.makersacademy.com", "Makers Academy")
		Bookmark.add("http://www.destroyallsoftware.com", "Destroy All Software")
		Bookmark.add("http://www.google.com", "Google")
	 
		bookmarks = Bookmark.all
	 
		expect(bookmarks.length).to eq 3
		expect(bookmarks.first).to be_a Bookmark
		expect(bookmarks.first.id).to eq bookmark.id
		expect(bookmarks.first.title).to eq 'Makers Academy'
		expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
	end 

	it 'allows user to add bookmark' do
		bookmark = Bookmark.add('http://www.example.org', 'Test Bookmark')
		persisted_data = PG.connect(dbname: 'bookmark_manager_test').query("SELECT * FROM bookmarks WHERE id = #{bookmark.id};")
	
		expect(bookmark).to be_a Bookmark
		expect(bookmark.id).to eq persisted_data.first['id']
		expect(bookmark.title).to eq 'Test Bookmark'
		expect(bookmark.url).to eq 'http://www.example.org'
	end
end
