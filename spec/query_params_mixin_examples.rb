require 'spec_helper'
require 'uri/query_params'

require 'uri'

shared_examples_for "URI::QueryParams::Mixin" do
  let(:raw_query) { 'x=1&y=one%20two&z' }
  let(:normalized_query) { 'x=1&y=one+two&z=' }

  subject { uri }

  before(:each) { uri.query = raw_query }

  it "should include QueryParams" do
    subject.class.should include(URI::QueryParams::Mixin)
  end

  it "should still provide access to #query" do
    uri.query.should == normalized_query
  end

  it "should provide #query_params" do
    should respond_to(:query_params)
  end

  it "should update #query_params after #query is set" do
    subject.query = 'u=2'
    subject.query_params['u'].should == '2'
  end

  it "should dump out the #query_params when accessing #query" do
    subject.query_params = {'u' => '3'}
    subject.query.should == 'u=3'
  end

  it "should properly escape query param values" do
    subject.query_params = {'x' => '1&2', 'y' => 'one=two', 'z' => '?'}

    subject.to_s.match(/\?(.+)$/)[1].should == "x=1%262&y=one%3Dtwo&z=%3F"
  end

  it "should deep-copy the query_params Hash" do
    original = subject.query_params.object_id

    subject.dup.query_params.object_id.should_not == original
    subject.clone.query_params.object_id.should_not == original
  end

  describe "#query_params" do
    subject { uri.query_params }

    it "should be a Hash" do
      subject.class.should == Hash
    end

    it "should contain params" do
      should_not be_empty
    end

    it "can contain single-word params" do
      subject['x'].should == '1'
    end

    it "can contain multi-word params" do
      subject['y'].should == 'one two'
    end

    it "can contain empty params" do
      subject['z'].should be_empty
    end
  end
end
