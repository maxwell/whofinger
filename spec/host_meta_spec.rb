require 'spec_helper'

describe HostMeta do
  before do
    @host_meta = HostMeta.new("maxwell@bar.com", true)
  end

  it 'iniitializes with a clean account record, and an ssl setting' do
    @host_meta.should_not be_nil
  end

  describe '#webfinger_profile_url' do
    it 'checks namespace matches the xrd spec, then gets the webfinger profile info' do
      @host_meta.should_receive(:namespace_matches_xrd_spec).and_return(true)
      @host_meta.should_receive(:webfinger_profile_location).and_return("foo")
      @host_meta.webfinger_profile_url
    end
  end

   describe '#url' do
     it 'should return canonical host-meta url for http' do
       @host_meta = HostMeta.new("maxwell@bar.com", false)
       @host_meta.url.should == "http://bar.com/.well-known/host-meta"
     end

     it 'can return the https version' do
       @host_meta.url.should == "https://bar.com/.well-known/host-meta"
     end
   end

   describe '#webfinger_profile_location' do
     it 'gsubs out {uri} for the account' do
        @host_meta.stub(:parsed_webfinger_template).and_return("{uri} is the coolest")
       @host_meta.webfinger_profile_location.should == "maxwell@bar.com is the coolest"
     end
   end
end