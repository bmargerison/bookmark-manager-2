require './lib/bookmark.rb'
require 'pg'

describe Bookmark do 
	it 'returns the list of all bookmarks' do
			connection = PG.connect(dbname: 'bookmark_manager_test')
			connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
			expect(Bookmark.all).to include("http://www.makersacademy.com")
	end 
end
