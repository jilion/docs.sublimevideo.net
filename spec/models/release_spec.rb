require 'fast_spec_helper'
require File.expand_path('app/models/release')
require 'active_support/core_ext/string'
require 'RedCloth'

describe Release do
  before do
    Rails.stub(:root) { Pathname.new(File.expand_path("spec/fixtures")) }
  end

  context "stable releases" do
    let(:releases) { described_class.all }

    describe "all" do
      subject { releases }

      it { should have(2).releases }
    end

    describe "first release" do
      subject { releases.first }

      its(:datetime)   { should eq DateTime.parse('2010-12-20-13:30') }
      its(:updated_at) { should eq DateTime.parse('2010-12-20-13:30') }
      its(:cache_key)  { should eq 'release-2010-12-20T13:30:00+00:00' }
    end

    describe "#atom_content" do
      subject { releases.first }

      it "should replace span and upcased label" do
        subject.atom_content.should include("[IMPROVED]")
        subject.atom_content.should include("[FIXED]")
      end
    end
  end

  context "beta releases" do
    let(:releases) { described_class.all('beta') }

    describe "all" do
      subject { releases }

      it { should have(3).releases }
    end

    describe "first release" do
      subject { releases[0] }

      its(:version)    { should eq '2.0.0' }
      its(:datetime)   { should eq DateTime.parse('2012-12-14-13:30') }
      its(:updated_at) { should eq DateTime.parse('2012-12-14-13:30') }
      its(:cache_key)  { should eq 'release-2012-12-14T13:30:00+00:00' }
    end

    describe "second release" do
      subject { releases[1] }

      its(:version)    { should eq '2.1.0-beta' }
      its(:datetime)   { should eq DateTime.parse('2013-01-05-10:57') }
      its(:updated_at) { should eq DateTime.parse('2013-01-05-10:57') }
      its(:cache_key)  { should eq 'release-2013-01-05T10:57:00+00:00' }
    end

    describe "third release" do
      subject { releases[2] }

      its(:version)    { should eq '2.2.0-alpha.1' }
      its(:datetime)   { should eq DateTime.parse('2013-01-06-15:17') }
      its(:updated_at) { should eq DateTime.parse('2013-01-06-15:17') }
      its(:cache_key)  { should eq 'release-2013-01-06T15:17:00+00:00' }
    end

    describe "#atom_content" do
      subject { releases.first }

      it "should replace span and upcased label" do
        subject.atom_content.should include("[IMPROVED]")
        subject.atom_content.should include("[FIXED]")
      end
    end
  end
end
