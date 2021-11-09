require './lib/bookmark.rb'
require 'pg'

describe Bookmark do 
	it 'returns the list of all bookmarks' do
		connection = PG.connect(dbname: 'bookmark_manager_test')
		connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
		expect(Bookmark.all).to include("http://www.makersacademy.com")
	end 

	it 'allows user to add bookmark' do
		connection = PG.connect(dbname: 'bookmark_manager_test')
		Bookmark.add("www.bbc.co.uk/news")
		expect(Bookmark.all).to include("www.bbc.co.uk/news")
	end
end
