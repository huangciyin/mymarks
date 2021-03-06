require 'spec_helper'

describe 'App' do
  include Rack::Test::Methods

  def app
    Sinatra::Application.new
  end

  it "gets /" do
    get '/'
    last_response.body.should include('<form')
  end

  it "gets /bookmarks" do
    MyMarks::Parser.should_receive(:get_html).with('X','Y').and_return 'XXX'
    post '/bookmarks?username=X&password=Y'
    last_response.body.should == '"XXX"'
  end

  it "is unauthorized when bookmarks could not be loaded" do
    MyMarks::Parser.should_receive(:get_html).and_return nil
    post '/bookmarks?username=X&password=Z'
    last_response.body.should == 'Authorisation failed'
    last_response.status.should == 403
  end
end
