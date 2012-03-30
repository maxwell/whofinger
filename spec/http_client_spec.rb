require 'spec_helper'

describe HttpClient do
  describe '#get' do
    it 'makes a request and grabs the body' do
      url ="https://bar.com/.well-known/host-meta"
      stub_request(:get, url).
        to_return(:status => 200, :body => host_meta_fixture)

      HttpClient.get(url).should == host_meta_fixture
    end

    it 'follows redirects' do
      original_url = "https://bar.com/.well-known/host-meta"
      redirect_url = "http://whereami.whatisthis/host-meta"

      stub_request(:get, original_url).
        to_return(:status => 302, :headers => { 'Location' => redirect_url })

      stub_request(:get, redirect_url)

      HttpClient.get(original_url)

      a_request(:get, redirect_url).should have_been_made
    end
  end
end