# frozen_string_literal: true

require 'bookmark'

describe Bookmark do
  let(:bookmark) { Bookmark.new(:url, :name) }

  it 'initializes with a name and a url' do
    expect(bookmark.name).to eq :name
    expect(bookmark.url).to eq :url
  end

  describe '#self.all' do
    it 'prints the list of bookmarks' do
      bookmarks = Bookmark.all
      expect(bookmarks).to include 'http://www.twitter.com'
    end
    
  end
end
