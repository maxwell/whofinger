require 'spec_helper'

describe Whofinger do
  let(:account){'maxwell@joindiaspora.com'}

  describe '#intialize' do
    it 'sets account ' do
      n = Whofinger.new("mbs348@gmail.com")
      n.account.should_not be nil
    end

    it "downcases account and strips whitespace, and gsub 'acct:'" do
      n = Whofinger.new("acct:BIGBOY@Example.Org ")
      n.account.should == 'bigboy@example.org'
    end

    it 'should set ssl as the default' do
      foo = Whofinger.new(account)
      foo.ssl.should be true
    end
  end

  describe '#fetch' do
    it 'works' do

    end
  end

  describe '#try_host_meta_on_ssl_and_then_non_ssl' do
    it 'tries https first' do
      good_host_meta = HostMeta.new(account, true)
      good_host_meta.stub(:fetch).and_return(good_host_meta)
      HostMeta.should_receive(:new).with(account, true).and_return(good_host_meta)

      n = Whofinger.new(account)
      host_meta = n.try_host_meta_on_ssl_and_then_non_ssl
      host_meta.ssl.should be_true
    end

     it 'tries with http second' do
      pending "foo"
      n = Whofinger.new(account)
      HostMeta.should_receive(:new).with(account, true).and_raise(StandardError)
      host_meta = n.try_host_meta_on_ssl_and_then_non_ssl
      host_meta.ssl.should be_false
    end
  end
end